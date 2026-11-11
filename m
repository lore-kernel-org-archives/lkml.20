Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364108;
	b=q0OInrkr/cF7TjYm1tasljnl5+egH98nbKuKc09TmdwsG+SFfrL9bkabYr/5ga0iMCBC
	 gfwORwKB5gCkG9uzXydUkJP96vgstif0Wrr07YKNgjws2e+RyoEDLI+6+DfkYMyHPSefS
	 f3sErbIT1dDKJv5vmRHrOEPdtPGaYuvd3XKidsz907dNxHx8S0WINoWDNLzDTVHUuopGp
	 HWVNzRSCt2ctyK3T1IfaxVKJQQlQr/kMBptiJh5eWLDfB01U8iIuNlvyj9sUZRc3mJxyK
	 qDRiKHxvjpInQ+mNzd1AJh4rTRGHBSoXi5g6FZge437Nts9UeHcblO9CPRR2i6/5GyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
	b=SMera0frCx5qGj3E7YcanesmNWKhATGVEmPodUcm7sk++ispatpU3lfOBCkN1DVMjqUQ
	 k/ymvNAfoksqhlKzcRfMV6rQNpxlIaP2XSR3aMmPa3pzyXyLtV1VyeWlqhxk+a7xpAoCO
	 ktAlIo+6f9A+d8vddgJUFX6BRtpMf0xdjHo+ou69iGgVjeqfw7tEb+fBWTH6NJZjvidN0
	 Xtt0FOu+EaN1gD0CBV4qBoL8wYvlk47HInU451z+l8cJmO+9Gx3kRdGrHSOjLSMuymfT3
	 oYufwCpUxe66S8k7YJNqFPoKEBdzfKaDSo5t1d1TvGpp/t63Qx8FOgXo3HZvTrL4Nzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTHAJ88P;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F800606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F800606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTHAJ88P
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37071c0f42aso4734925eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364107; x=1794968907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
        b=QTHAJ88P6t7TG3Sa6xSPIQ7wHWglXc8XZ57RXXmGA5xrATbTAPpd8HJXGbj5X2zucC
         goHjlrfmpw7Ub1efUYYVZyT7ub4CrhY9eb2s643NkHY2+kWcyCTTi0hAvNRV7Q4PQM7S
         YhYkFyQyOp5gEagw7x+bG/j2nYN7netRhS7POYlkEFAJ99K6m1DkmpnWG9dsacScWiUn
         583qWLm0e33tRIg2JVr6TXcl2plsw32KtKAy3mFRhkJEjEGuI2zH7Gt5He0dk/HrhEVm
         7K2C6McU1L8B0+Cy9/NbjvT+27IhZOmdZ5PtmGXGS8gTov9NL/DFMZQgiZ/3cDHgxszm
         QAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364107; x=1794968907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
        b=ZVcMey2ByQtGaPrYXPTccg8Vbxl9Ermdgvpx7YRP9nwG5HENvjkRsQLEwSSrfPUdl4
         Z00m/M7VGnaf83RrGYaUHHGbWcpn8P6P31KRcLMHPcwTt+NC9DfTR33zBgGO3TneFGT9
         kZ/ckbR4kmPJ9C37amiMNy3l+kUd6xU2pGf3GE8SdRGOY5Oz80W32pIY0bEj4210ooKe
         aWX1qs/h3LzvG3r9qloy9Ri8+nbuq8mhT/w8rxi/ICoC6X5HiJ2SFIfrpioDf9xiAsUc
         QaCcyJJWfq1cPdlfm2mwKJEwaq3tViGIEiikMm+VD0X0ZUKkquV1GMrVWC/ZOvereUHA
         AIpQ==
X-Forwarded-Encrypted: i=1; AL+hErHa7XpBXxKmyF/FCy5AEuPqxu76F1e6BFrCEVsE5nUSVxpgXR+uhekdoxWjtnzoakpdIe2Md+/EaT0U9Rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ouO5Iwr3fNQytnrkFn59c4VhjIIExFHCQWiF1GgbWRkUZXcE9
	X/LT1RX+xhEh75sc6vrdx3bcIcIgt8haj3kRhX9IME+INY2W/hjzugMc
X-Gm-Gg: AYBFou1A5ahEQnxjo2AK+6o0Ts/pMgfT7OU3XGWB9i83wV+SKoloLQlcTlqs21obHpK
	ZNJ7QHiGICFdlF+loKIY1No2YAEDV41f4+3rX3T5T570FtrCzZVN/N/PBwdbk0LE7hO2cv/olJF
	Pcm8ZA0/kQ8RlsaY31IAPZDYXD9qkIviz9rBJGahyaIm/qdGZFAkOk4Cs4msC2RRVtrmQCUpFne
	QngDRLdK5niL6J3EYFJOekqpqJRbueWkd+I31+PmBAHtlS9xbhhg5oLh/IoVRsJvuMfrZBRKOD5
	jgNNF0o7V9zjN6WwGzwNvilE3ifnxmRDS1SQI3i3Wnjro/UIQdMN6D5eQQ9HYys2TRqSQ589+QV
	H7ECHqqHt3WkwIVhjhDqifiKn6BODBrRN0hz06106i9M4EKctX2uk+HQJQljT+o7UAeL6YAs8DL
	z36Fc18HQuN8bWr/+wo4fPuPLkQbc8ShlS3/xOdpbmaPYjVLckmZUOt7KdGgTVWeGu+gbmDG3It
	dMv6F6S3XjELm3RrWl74SVziJgvNnbqDpZGke/F0fSrvLquHdEeVrPaoMtmYzkc4QBVhBf8+AzY
	2ySDzLqCjiWBSQl729VCaWtKZAWg/nPg3AirS9Q27dTkK5kykdIKQE+t0x7Q+4DAKOJ802pmlqY
	KzTv9HmHv5ErpSKm9dSYQLhnHSAoEmEFmp6uGAEi+QOvp
X-Received: by 2002:a05:7300:51c3:b0:36e:d060:8bad with SMTP id 5a478bee46e88-3768385dc4fmr1822913eec.5.1794364107186;
        Tue, 10 Nov 2026 18:28:27 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:26 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/6] ASoC: dwc: Fix bit clock rate in TDM mode
Date: Wed, 11 Nov 2026 09:27:26 +0700
Message-ID: <20261111022731.8243-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The bit clock is computed as rate * data_width * 2, which only fits
a two-slot I2S frame. Use rate * data_width * tdm_slots in TDM mode.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the indentation fixes into a separate commit.
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index dbda943cfaf3..1f4d06a82333 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -332,6 +332,9 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 		} else {
 			u32 bitclk = config->sample_rate *
 					config->data_width * 2;
+			if (dev->tdm_slots)
+				bitclk = config->sample_rate *
+					 config->data_width * dev->tdm_slots;
 
 			ret = clk_set_rate(dev->clk, bitclk);
 			if (ret) {
-- 
2.43.0

