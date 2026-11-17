Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915905;
	b=vHIk2UTfcIYff+zajcDrauNDSVYbArJbE8Npp4deEFE9FFp7VvZfAiJ4w567qQHFUmkp
	 Gz0K5Z3Qj4ELl9yo5nRIkdW8Tq1k3RdRqM1fwHso9I/CGBFkcUAXF9tMRSEGA+lBAh7bu
	 V3swc60yn8XYCT/pVM+o58QfnqQLssARz7w2Jd+SYAIIG1MfL60zn/PWgFfuFPpPnkbnD
	 ver7ZSqY7F+wbYhRXVW4xiMkRfvr7b6iAB+fVwWHJrDivzp8Ti/Iq04DfONhqEgMkbKqr
	 zOFyh+R3lLnZXk2E+jOKirR5VTiTr3BQHwDmajssb3b8YHTJVrcFz01BTj75Sk1k4Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EHTZ/1KUGWNJTaA44N1B6xy5DZM7ZoLUszGDdI/4cdo=;
	b=JKhYQlCf3qG4CFqDcOoH5iF+vIZPHqrDGIWlBI85rIrxRY0HsTzi5w6tYnnNA518VpwX
	 sXOcocJd6O7FfrtNWi8PiIxezYVW0XbAKjOzL/MuRoUkgtmVSRGILBUUmjCR5O3oV3bw2
	 9Csiebb5RWhE0Y4wLYfAQhuyx+LHJppJP6ronuBHw71UnKkMzROpda5SvDP8pzmP3qU6H
	 +U+jcFPXKRMSw46811CAhr6ZaW7hG9MpgnHx6LRhaF7CzPjKEsW+17XmQJrWSHkRVR/kh
	 UP1s5Jjbzo2fAu+vUbCfjxMt24Jfn3OpvGq/8ghoKMwtm3NBB5KmlBpJJdvuH0vb7HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGiaafKL;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10508606A884
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10508606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGiaafKL
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9d7791b00so45381085ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915904; x=1795520704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHTZ/1KUGWNJTaA44N1B6xy5DZM7ZoLUszGDdI/4cdo=;
        b=VGiaafKLm0Xdg+3FKaZmGIukFPRYRb0YRpgodlpQl332TOMfRYzBIo40kh43Y/yMpT
         GvI48PA2g646iMvr6fPnu2MJZ556ul+EKeH5SNIjMMw7FiPcalTQ14hpEgVkeF8qTDku
         fvBrp+hrjdWQJfpzei8N+dhaKgQiY+fyFdZuCBFZHR5Hfkf8cyrPPniI9Nv9j7yRuvVO
         9iJBKo2IWm4WNjIwGOp331BuCujIYFY+O3O7AYZ2geCUFwxTzJRC8KECDBoO8SQzuzBC
         ztDLnmG0FRlFDwZ8z5GxB2yRTws6BG31D1AWMbdNjuUURQXfxFaNRWudTvlqBG7YTDrw
         uM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915904; x=1795520704;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHTZ/1KUGWNJTaA44N1B6xy5DZM7ZoLUszGDdI/4cdo=;
        b=XZv/0Hvh8gGZN003dbJPKvjnwKxGFSMAeQLT/rv05dhBPz3ZUVvqjEzXzK8tC+DbxH
         aO2rJlQJeX0kJZnBSjHdALPLxeR1ld/YYo3ZN4+MfpkbKWnTsbuwtiHpnqlhR3iY1L1U
         i63DYplpWjFNNBGKBZIqq4etZuFH59FBT7RIKI7tZswrmFaT3qReLpsKf4FDBsJy3KBn
         OFjOncpjT4nUjjoK+GMNxV/mpLv8ABZzFoJJFJDlx3u6Nkb6VZ1DEdnvGQ23tR4udFzH
         x1H6anGDELCklqj+oMkbpDVEIKYCmfNgL6isJUVeg04KPRcwSFTJfQi/rNwYbNSOnau6
         Jv2w==
X-Forwarded-Encrypted: i=1; AL+hErH6wkRpR4suq+Mu6luHxj146142YXHqVPUodKMMB3qbzFTGH27zvSVMMnwcZ2gcYn+EY5p3HTME9OcQBpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91V5B15O2RLsRux5w5Ro3nXkcup0irSfQH/6UXPUGnFcIzUaPO
	HcZkd0otGauo9ysrWtnaw1zznmTPDF9RgAoEPlzCaqM/y4yBYhNVf7Mr
X-Gm-Gg: AZFdTZfJDwXN4JbV9tv0Q7aV7FU7iWFD+bJpWo4t1mvUmQiyQen2iYXeOUXKgykTUVl
	tMrulG50yONK03t/XsZ6LYi7q108DNzi7I0MoebNMRUlKzqGKhBv8NUnY+zSu1srh5fSqFFtQAW
	q01pJfCzxZxBXu/BynRQffVSCXXRYJTO3aKtjrr/IniHMM5B6fpfqu6YBI1cx4lJ0oi7lCALElU
	Begjy2j13zgNZAwKcLp9cfGiWPn7SWg8mGvfCWzP5H8RN0oVfb0NmDFa5wRQbt5gHDW0ijc8LlT
	cUd/GOPT3p8hRrbuio3ecGx00RUgqTjcLOeGa/BVi0kRITFr2i+6t1oOSHHhMkWmZ+zbgRQsmvV
	gm4vmwI/TpOV+QHL+6skuQy05KS2dzsm5FIms4zF00A854MuVsMs6xTKDnH6Ew9f8R04cXEG3nE
	FhdfVL5py1DkL4CbUfNKV1/eonu8W3mMuYxzUjE58h3lGWShDYmLoU8QTXDV8pEUk14vpmmUUYx
	4YNO+I14Bf5jLZWBNwj0OCYumBb9fkZ5yepsau0Js1QB3BOJd7ZEsFuPK2OgFKeoJNsT//Yyxir
	OWk4ul+2pUs65w5yJQ9VLT3qqceWanYErV6rsTN7y0em
X-Received: by 2002:a17:903:228c:b0:2e6:5ef:abe9 with SMTP id d9443c01a7336-2ee0dcd0c58mr112203625ad.37.1794915904206;
        Tue, 17 Nov 2026 03:45:04 -0800 (PST)
Received: from gmail.com ([116.162.234.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a1636csm13585765ad.17.2026.11.17.03.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:45:03 -0800 (PST)
From: Xue Boyang <fuchen.dust@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: kadlec@netfilter.org,
	fw@strlen.de,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phil@nwl.cc,
	sunyiqixm@gmail.com,
	bsdhenrymartin@gmail.com
Subject: Re: [PATCH nf v4] netfilter: ipset: fix double free on kernel-side delete during resize
Date: Tue, 17 Nov 2026 05:44:51 -0600
Message-ID: <20261117114451.608829-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avwswXiJh8HUPa5T@chamomile>
References: <20261117101018.523826-1-fuchen.dust@gmail.com> <avwswXiJh8HUPa5T@chamomile>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the pointer. I had not taken that series into account when
preparing v4.

I have now looked through it. The rhashtable conversion removes the
ipset-specific table-copy resize path, so it appears to avoid this
double-free/UAF class at its root rather than fixing the individual
races in the old resize implementation.

I will run the reproducer and the related GC/dump tests against v10 and
report the results.

Since that series targets nf-next and is a fairly large conversion,
while this issue also affects existing and stable kernels, would you
prefer that I replace this v4 synchronization rework with a smaller
targeted fix for nf/stable, leaving the complete cleanup to the
rhashtable series?
