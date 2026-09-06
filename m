Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B0382F1E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788692721; cv=none; b=mfx2wlQzDsMhKgdjcZJHC6wAEPvdUKBNSCPCby8O2fGveUAuZksSc5MRTLsXQ0qkUfGSj58sYEicWMY2LL8mP9eVvhBcDBrmI2zIPisYGtcEVwet/n55+NxHBLk3/VJnRhpmB/yY+NpdUdokdL6FkyMDU2qsKiIZjvEKSuTdahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788692721; c=relaxed/simple;
	bh=tvdFzmKtwoFDJ+q1pM6DGnbGu6Ko8qfu6YNLpfpo3h8=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=Kh/5g/U7Xk35hcio1HujtK/vBEHAyfSfUEdznedQHl2MqLvBrSh9Dd+1e5plpSh/jQNQ5eNpMY5wscm8ec2/m9cvFT4Ui0/2eXAUzVol7++7L4S+Q7RIXnv84PV50Q33r0FdJwt447KI/eaNmKv3YzcVkg2z68nYtFTBkd57R/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnHm9ciW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnHm9ciW"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3384713a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788692719; x=1789297519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9gyLWtQLohjNP+UG4PRUGY7mDiKdRQaFAscLEnUlZM=;
        b=mnHm9ciW1jOamz5QsHS/6Og08nilUmO0rHjnvdKkkgm3xEEeCTF7li+fBn2Gv9eTnY
         w2dspwntaXSovpYdBP/1XopjGG0+kmrdhdLnrZPYisBCQRtEfED+DQztWeHaQcfZTbW4
         LVj98unjzia5W68ZJfcbn9plMy1bpcLa3vtnlN+1h1Yw/+XyDWx1xg3wnIV807gQJfgF
         WuCCOFoO6w4rbi8mBwHc4BAfAFrQRzuzatMYugUsc9nNCW5G5iVs7muayVKD6Q6CCAm2
         iCHerp5jGrr6zAk7qF90TqjRCoOTsVxXVrSsT5+e+T4SfCdKFes87U1LcJLntnouiQ1q
         9Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788692719; x=1789297519;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w9gyLWtQLohjNP+UG4PRUGY7mDiKdRQaFAscLEnUlZM=;
        b=NzoAy3brDf+s9b3KZYY0Ll74I1OMXnie8KBgWaMY8iSfHIilPBl87ZT6j60A1px0Cz
         0CgosGpd6G+QmXY+1JSMNlexYPkppar4S4ruD3hLpK2RRbbbOK8KhSFvetBHpJ6iDhen
         1IgyKdCCbHXY5e/LmMJWC4X3XVovMgRD3eE1OSmXsEN+6DkEh20Rfx0fV9Ar8G4sdlIz
         eNi1tqT3U6uoe1aFIXcOZqoK0J540RRTT6orkpkEFJz+bNFl5PqfQbx1DPtEIrDNasep
         JIot4AyzmGB8X8H+a/OQxfWB+ZN7DR374kvGHFKWhcWLBZMMr+ABVtEwfGquHkM3edbF
         3Wzw==
X-Forwarded-Encrypted: i=1; AKwUvBw9T/vNvVfti2BUqFQHfUldzjzNTyqhep4L21NXxOeqmpbWPRU1GPn9eaIvZf9eFdqEq3Niq4vhcSEoQGo=@vger.kernel.org
X-Gm-Message-State: AFuF++nfIBNFIuKDxXASH6NO5/IKPHjebc6dg+LxmijHfsl7zkANIwOO
	cNWuCtqoeSu2KlEJ0ydu0LDVteHnwlSm1xQ5cPbiTO/IP9Dudalaz+yE
X-Gm-Gg: AYBFou1jd2MwOiGNBMOJfLJyxWOUgw/151PySLqUOvIaqKZvvkDIRlBeQjZuYfMPmjG
	h2XlPOYm81VFYSzPizOMnchk0C9ZJmUZUhpkHBSUHMg+syzLX9f1NiKqVKL48LMl/sZVnK9543+
	gvrKhtIzqzBiZ/DzPw49Rrf6/LbKqyr77YaTOL0QDrDXu3QLfQz5Lkq2D3KwPYUlUmaAKQ/3Qlv
	fKJZGGwQr76iIg1Cg8FhyPlzE7FsuO+0ItUwbZsp/pEaEFKf0rtZLN5YFqQGxvPbvKCaIW4JZhS
	3DVSVZfMqVR/iS94Wm1iyz2Pk1kKKv5I1j5ofgvqDeb9FS0eDSXgj0BdL+hLezau1raHgDeDK9A
	YaF+Y/lk39qwWzSB7Jx0jwW/0isQ+b/t1qK9/dwatFl1WROhSCXUqCCKIXEUHDQbZwXPtuWTuWx
	uSJ010O7hwP6uaYJ5vAS8LAfyG9SNrSkLLnL/4wgt7u2AMu+3YdYzV9CFlrGyeVN/E5m5ZIoUWD
	aQllEvkXZ4/afjNpLAIi4UmW6XI+Rv217j5XCdWEDKZ1En4fSbIs8sjCA==
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr24009365a91.8.1788692719394;
        Sun, 06 Sep 2026 04:05:19 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm22779262c88.5.2026.09.06.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:05:19 -0700 (PDT)
Message-ID: <6a9d48ef.4987c784.3608f9.714a@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: sai.krishna.potthuri@amd.com, conall.ogriofa@amd.com, jic23@kernel.org
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Date: 6 Sep 2026 16:35:18 +0530
Subject: [PATCH] iio: adc: xilinx-ams: fix OOB read in ams_get_ext_chan()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The PL external-channel "reg" property is only checked against it=
s=0D=0Aupper bound (AMS_PL_MAX_EXT_CHANNEL + 30 =3D=3D 50), match=
ing the=0D=0A'maximum: 50' constraint in the devicetree binding=0D=0A=
(Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml),=
 but=0D=0Athe binding also documents 'minimum: 20' which the driv=
er never=0D=0Aenforces at runtime.=0D=0A=0D=0Aext_chan is compute=
d as 'reg + AMS_PL_MAX_FIXED_CHANNEL - 30' in=0D=0Aunsigned arith=
metic. For any reg < 20 (e.g. a hand-written or=0D=0Amalformed de=
vicetree overlay with reg =3D <0>), this underflows to a=0D=0Ahug=
e unsigned value, and the following=0D=0A=0D=0A	memcpy(chan, &ams=
_pl_channels[ext_chan], sizeof(*channels));=0D=0A=0D=0Areads far =
outside the 31-entry ams_pl_channels[] array.=0D=0A=0D=0AReject a=
ny reg value that would produce an out-of-range ext_chan=0D=0Abef=
ore it is used to index ams_pl_channels[], instead of relying onl=
y=0D=0Aon the upper-bound check.=0D=0A=0D=0ASigned-off-by: Manush=
 Prajwal <manushprajwal555@gmail.com>=0D=0A---=0D=0A drivers/iio/=
adc/xilinx-ams.c | 5 ++++-=0D=0A 1 file changed, 4 insertions(+),=
 1 deletion(-)=0D=0A=0D=0Adiff --git a/drivers/iio/adc/xilinx-ams=
.c b/drivers/iio/adc/xilinx-ams.c=0D=0Aindex 158e6133a..cd778d053=
 100644=0D=0A--- a/drivers/iio/adc/xilinx-ams.c=0D=0A+++ b/driver=
s/iio/adc/xilinx-ams.c=0D=0A@@ -1154,8 +1154,11 @@ static int ams=
_get_ext_chan(struct fwnode_handle *chan_node,=0D=0A 		if (ret ||=
 reg > AMS_PL_MAX_EXT_CHANNEL + 30)=0D=0A 			continue;=0D=0A =0D=0A=
-		chan =3D &channels[num_channels];=0D=0A 		ext_chan =3D reg + A=
MS_PL_MAX_FIXED_CHANNEL - 30;=0D=0A+		if (ext_chan >=3D ARRAY_SIZ=
E(ams_pl_channels))=0D=0A+			continue;=0D=0A+=0D=0A+		chan =3D &c=
hannels[num_channels];=0D=0A 		memcpy(chan, &ams_pl_channels[ext_=
chan], sizeof(*channels));=0D=0A =0D=0A 		if (fwnode_property_rea=
d_bool(child, "xlnx,bipolar"))=0D=0A-- =0D=0A2.46.2.windows.1=0D=0A

