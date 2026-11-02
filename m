Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657122;
	b=zHHtRz0uKygLNchCWBIWnwC3rdyNlNd9NcTUnavuJqhon0fFIM2Jzgk8YTP/7Q92fNr2
	 o0+3oxQazEooc0hud+jcaeNic5Dul7Szt3h3N8usFgnAFiQbyNG2NsfqzbJfRmZK6VTBe
	 LfX7zDIWJMDEU6qK3NKJTkiBbR+PpTG2tOu6qjykt5XXxA0xDxeRwluaItzJkUcw9UXdc
	 7eD3P4tGXjH7vAGW6oHEtAHrq73glsEs17Qt2FtoQ3885PKrEobITbn3LEUlUxr+b7k4S
	 b2kB8WKhuj5MGrUTGN+m8nH7UQszU5UcGpgv0BddgIHKclE8vRJbpjchr8p4z12+yIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
	b=S1GOQLhg7bOIvpyJCYJqqOVjhlTh4O6cjjTjPdRRGFwZP/lIra1xVf6iV6uNdMTR/9PT
	 5+c321aRkcR8R9TWoQkvbNCkIKRjRChTkep+NwBGl5Mh0D8TpfjvOzQb8W+WEMyHtDCWA
	 k+Gap8/6gIBtAVNtub7kqcZ2ytDJrgZS6tFrz10Q5ZcnpBvNymkWtmEyd7HYBjuMjRpbY
	 xadjmxyBz8Q4PS0M36j8yIwVedo//D2C9LXKQKC5onplyKGzNABmRurtDRXVLKuSmOwhy
	 1BISVT9zVqmH3rIhXM9g8W5eTm8z1O32NTPQALzsYHG9up8ZxWdZmCkWWfP74xxqLoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUs3mu89;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114DB6082BCF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114DB6082BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUs3mu89
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso6881763eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657121; x=1794261921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=PUs3mu89+syzBRQDWzZ5ixeKkYfm7Ii2ag28THP8+Pd9LkZZQOro6Z/HEuWYy7rQEf
         6s25DD6Mt3qyvJ8QfIjMR75zutVoFrxfYCDKAftAiS4v5jL4bj0qUJfNqKmlOqq4zUlR
         RPafHTP0eJY2vVTf9ppyCe+YK8I7tlameB6HcKJqSgVyGEbnjZHG1HK5MEawyr7VMhOX
         8ZTHNrPpSQA5BFgYTbWPLSF/R87ic5NTl3MnIuhRRvJNwFmMfHdviPxnyVboRlWk39Mt
         wghhoMBEaOFeFVHMYbZ2U+snwUafVNI0uu0hGUcxqhrZjFRY9hAWw13syb8TM+TuaWRF
         N4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657121; x=1794261921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=fO3O7O5Ei795avya79W37eZdwYTjE2rKKqYptWTupYaP60IsqVxqrMLk/SdGzcksGI
         zpyWwYQo9INKgFdJtdZqQVtKF5j0t5ewkBUaD02Lx7OdMn3bEzdA4c7Ku4OY+WhCEaql
         /3DzgIYP/oknjLSI88urkEylf3nOkOOp899L/pmBEyHOCXTZJwaXoIE6D937F9pKxaHG
         tBfrOE/WOvSDQT3asW5geEJHTSuBV/zZRKFUe0KTFsZ7Mia7hkeouLiWWiCYtRtWh7Sn
         n9e/DPOzQ0wEeo3/7INE0ysbAIl9naVyGln65FkmCa5wPcZbXs+XxnHGMyPE6725wg3K
         cVqA==
X-Forwarded-Encrypted: i=1; AKwUvBwqg9Pj1c5o8Y2phLiF1YSdqyLUlBE0yqXy9ggTpizg2ju03JnhjHzsH0EXDn4s2MRMUqWrM0tqCt5p4gg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MQKb+EQBLwdAypj5MFch0UXgTOwitz32OkC8m1Y+p2F2s+uTp
	HeE1fLxtJrl0VOdNUw9VFTm8cRkhfgueQsG8h2f7d2UWaiAqrUN3JhYI
X-Gm-Gg: AYBFou2LU7N4oYYmAApE1Zr+fQt/eWChxPFPE2I2A7wT+fLJK3xBbMlIeT21fe5qRVK
	RxkqjzcPTMCvgSaoajTEFUJAhdeRZLfWXEVnwNT/qJSWty3JOGBW4aeDYnnQ9P777tVX91ozbio
	v6ggKBatLHYL5t5uFCgvizKb7w7Sw5BYgsAVF/ifLBimW5O0JPMvzG7vp7oLu/mdNUN7Jh0TUWG
	12St8LPxfEb+kExGFXiC9J3DjZE4ndsFvuuSfG3dkFecWvthQxPkJxW04LEkmpo+/1YEe/LgluO
	Uf3QRDiDoImR8j9nExfVnvIZYafGRRh4yY7jToz3M6KrBPIvDFQw6ItjxpPYmvNU66f6N9v7ZcM
	Bcz4K33JEz0czR+f0I+NCOwvs8T0MNw3ykJYBHJPiz1mAh078PZBNT+Qt57O7i2j842Nf9g2vOS
	ZOhDAUyhAn8i6NldcaYTzAqtUevGIaCyjIk1wQwHOiIuy6qNiwHK2+7f/Z9hTewP7cDGbmgOX+K
	6+wKacsn2mvmWx//l+G/j9jiu6vpIbLpdLu+FY8U+5M0R9p5KSqIurdbfnJ+PsEKRYNSvVVDYlX
	b0q2yV7gBo4ihyN6cVRUWIB4p6v2J4dOgI6dPeljkIfJjO0bblIM+PHG8ekkg5jWTg==
X-Received: by 2002:a05:7300:3b0c:b0:36a:238:1485 with SMTP id 5a478bee46e88-36a4244276cmr24803721eec.37.1793657120646;
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm42657742eec.7.2026.11.02.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	media-ci@linuxtv.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] media: iris: add iris4 specific H265 line buffer calculation
Date: Tue,  3 Nov 2026 07:05:19 +0900
Message-ID: <20261102220519.1738-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001153221.4FAC61F000FF@smtp.kernel.org>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com> <20261001153221.4FAC61F000FF@smtp.kernel.org>
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

On Thu, 01 Oct 2026 15:32:20 +0000, sashiko-bot@kernel.org wrote:
> > +		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
[...]
> > +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
> > +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
[...]
> Does this code multiply dpb_obp by num_vpp_pipes twice?
[...]
> Is this double multiplication intentional, or should one of the
> multipliers be removed to prevent over-allocating the line buffer?

Some data on this from a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), with
this patch on v7.3 and out-of-tree Kaanapali support. Hardware decodes
were compared bit for bit with software decoding:

                             HEVC Main10      HEVC Main
                             1080p   2160p    1080p
  v4 3/6 as is               pass    pass     pass
  dpb_obp multiplied once    fail    fail     pass
  once, OPB lines doubled
  for 10-bit output          pass    pass     pass

The failures are "session error received 0x4000005: insufficient
resources" with no frames decoded.

With num_vpp_pipes = 2, the second multiplication doubles dpb_obp.
That is what 10-bit output needs. With one multiplication, Main10
passes once the size_dpb_opb() part is doubled for a 10-bit capture
format. 8-bit streams pass without that.

Is the second multiplication meant to cover 10-bit output? If not, I
can send the 10-bit sizing as a patch on top of this series.

Thanks,
Joonhoe Kim
