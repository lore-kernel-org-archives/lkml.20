Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935143;
	b=wMZNVgKt+3sJg2yF7Qjvd95LimKgU9EyG+Vuhe8vVgozCu6fxIaEHppbXAIeqFIV/nXG
	 68mlCvlg+pXHjXAKvH/dm7/KVDEE5mDqNtOCvfXqoLj4awlZx3YUp8BTgt789Y0HuvRoE
	 n4WRc7WF+J8S3PxV6dz0uE7zcE+9PcPLqXGR5v9JjS9XLeXwKkuVp13Yu9vHnUm2H8Hc1
	 ZrwJXi5bwd9P/Ws/139fYYwIiXQi2menmy0w9WdSj3YyaChEuN2zmpNY3ZV3yr++jZ3VY
	 sLYc15qSdZvpYCzJ7MhBScxJgf0vxgb0WbdoioE93Grqn2jYNMCwsetWTQ/il2SU0sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=inYRrs6iR94QR0JIo3pCdsEkjaH5Pl/3z0meAGRZ0V4=;
	b=B1yN2BlJWS8w64WuerSzNNG+1/M/hu0lTd+8Xe3HigOW+SVvyPwZJc3MmNR/MwjQ1Oxc
	 qySNSrr4w10T1aAWpi2TRFXEZ+ZNUmT3PosLgj1PKopb2EdjQYGEeLECu/bqE6thr+nLs
	 txrDVwqBzVF86Jog7kTCNdd8gJn+K4e+ILgCqnLbg1zmDSV4zrCnZP77EAeqPGyAeyWEj
	 OlpgwEsuswid9sFF6Ce04p/KEzH5SSJr0iGULbPkG8vXgO9PzA4KQpXobpxHEuIBZnzqO
	 tgCkwylorZLM5fC/6LT9KXBLpKciOIwHFqIayIMsZq7xP137EXrONmVBQD5YnJ9s4fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rTYoFPDM;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87DD606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E87DD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rTYoFPDM
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f563d1c6so2006684f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935141; x=1795539941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inYRrs6iR94QR0JIo3pCdsEkjaH5Pl/3z0meAGRZ0V4=;
        b=rTYoFPDMV4yHDeSSzCIhXz9Bqlic868Rl+75gbJGr3p9NcLqQARh5mKBDYT4xWc+Dh
         jVC6f3naEYgV7DvZ+6opdbS1x0LY5Frl/BOLYZVSstvkvBbVkJReSBOtl5oyrJmXyagX
         K6Znyv/wUXopbFOFr0JMCRV1kANTGZHMd4ksiQb/hB5gBTt613gTyq5c07j1CmCo7zbD
         rgYvIttuHgOlf6FyEm8Lp4tre/b2omggnYPrvZo5o0Jns/tdPzjbF/VbZmZQ6s1to60t
         3RX/e8m/uw/p/0ykj2zbSMIcr9qTuARMRapsYsH3jiPXd32l5lqA9HEBqBCVWpcM7f9y
         jLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935141; x=1795539941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inYRrs6iR94QR0JIo3pCdsEkjaH5Pl/3z0meAGRZ0V4=;
        b=FNZmJ2Vn8BjQOCBocplyAsj5sYCqA2BJEmHxpk5u0AFUY/9pIX0VkiDpAH0/Hqe2/J
         jQR29hv1mo0drJGK8rVRUvr3mRFlt7lhzhFURGazT6DX9gg+2Lw8WIrNoub4DUU5iTQv
         xA6K/P/pfHUK8HfWj2EgZ0lwd1uM1otpeo41ZLVne8tnSlptMhZ82SlNHfEVogalSHF7
         HR7czaa5yZ+/HOO2fJzIEI1CC6AE5xmh1C4+wlmh5pucDLwqJdcUlWt4ZpAAWlg8i7Cl
         SPU858q9a1erxwOy/+xeXA+ubLe6DgiJnu/YmgCKejwIc10gMVPDiSKsvkrs386v9ios
         7Xxw==
X-Forwarded-Encrypted: i=1; AL+hErF4i8WRBYM6wug2DYMggX9Wi+onzFE0xHs8O9eflpdTZdvnbno95NkpOu7VtHkdCfOsebCwD/bKmpiMqx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eAWqPxfQRm/5tc5QoE4vJNe0EyZVN8GuNofzUCGeRE5jCObvK
	ReAxI4qxjffbfVyacz+WkBRA7Yzl02vMd0q90U4/k1Kn3BBxoKTpvqn+
X-Gm-Gg: AZFdTZfzUX7spM5fLGFnbcojBjrQyfy80zFffCYTc7IU+j43whxVKF47hY+DGT8Zebh
	blfDyXGlPmVLpJ3izQxhLHecmMzh9aOs/MV2ELhgwrLkoPALCFnXitw54U4wA9t/DhmR43rr2kw
	zPmfxRqJFU83YiTzBEw7sAXUJppM5YRT4ORcqp31mwo5IQBMTeu3MvgAyx/qew7H7QrpXTSO1YF
	dkiL8hupPCpPTAzO9NKgY6RNcMsoM6oGMgSIox5YTHhFA87yllPpHeEuXxDbevXOiWtaFetRl0L
	BGmXr6z+TXVHyKMpSpdTt409qjCgCRAklMTMYJ+l65TSHel7va8GnJUyPrwAslVzpsZlGVHwCn7
	MdiOClHXG0XG4RHDq/jEe8j/D5LTVaF/bPssvO/Dz0SmqESyxgm1OWP1BlWb6zTOnyPg8hZB21x
	Hckm4Hg2XkQzM8hVM6nv3QQ/7d4KDjKA9+gU35b9urqFwuB7AT+r1qOn6dBNvC0qLw6bc5hlPNo
	vqalDdmjXDUP6tgCuGA2zw95ORFhYgUqdK+XTPJGgxehzQyhSa0nEDtMjgsRmL8SjpUJFPHZwAJ
	DhM/kOzKlO0dPLyPPFQxfb49TKpwtjS9PaQ=
X-Received: by 2002:a05:6000:2009:b0:4a4:d8e9:eb5f with SMTP id ffacd0b85a97d-4a63378660fmr190808f8f.4.1794935141090;
        Tue, 17 Nov 2026 09:05:41 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a538b3d46dsm2678707f8f.43.2026.11.17.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:05:40 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v2 3/3] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Tue, 17 Nov 2026 18:05:39 +0100
Message-ID: <20261117170539.1839165-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

> Could recovery use an iteration that cannot silently skip stations?

v3 adds a patch before this one: rtw_iterate_stas() links the stations
through a list node in struct rtw_sta_info instead of allocating an
entry, so the collection cannot fail. All callers hold rtwdev->mutex,
and no station iterator collects again.

I could not get the hang on the rig. With a test build that skips the
station during the recovery and leaves its BE queue on rtwdev->txqs, the
station came back without a list report or a lockup; I assume the TX
work ran before the station was added again and took the queue off the
list. The skip itself is real, and the new patch removes it.

Mehmet
