Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290F33033EB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901968; cv=none; b=Sr/I8IwdmsICJPWDeSqUxtUmmnBpzjxxxMPvJteVzNkxlIPFuroczju9zCjWees7JkWZoWSDgKGytW8PyYNHtG+Xr23/9E7LFh/XDCt7OiaWsgFCX1O2NZMjujJdPZph/ehXpi8jE29/jCJmeM3ZAGkREej8iT7RNlveBJCCr98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901968; c=relaxed/simple;
	bh=pjp4l55TcSvtQ0qk1M8HaIkpbfVrhCBR046DcCeU/U4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=W7ax24N8IamZJDbr3xCndeiM6ejmJbuodlTvSCTpUwUQs8Bn4Tx82rYEFmOqfbvrFAHWlUXi6ghoHW9Z/Mg9mxeaQVQs1L0lPCAg8sQfCOEi5L1DLO/U9AUdWaCTHX9IfBJJvuwbqMizPT/7zqJLfcINRMRIc9p0rYiWeUG91YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I+SYkX0B; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I+SYkX0B"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c255acff671so67262566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787901964; x=1788506764; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zT7X/XiN8cWELBs01ki64OmNK2wItsswFcyj5x5QOQ=;
        b=I+SYkX0BBTu0luCT2xd+fEbQw66drIePy8DC415z35QxHhV3ItAx7fWIzpUIli06GL
         euChHQtGcW1+M/8hEGGzbfOqdhGbr/wZ6Zj+igukZS0w0XZOlnXA3Kaj20S2/nImHVe1
         idfy27Wg1LXZFAOXnnsGuiOsyO9PU6JxdgfCqTyFlBCyW5BnIq5ql7JJDK6IkHzTEcF+
         Y1SbRAe2ot7BwRD747CRHxX389f+t4X6JJf5U1MyrfkZviEIy9lRX7zlA9ZgKlgQJQpr
         2GJ8cTrrbCixjbUhENtP8uWmqL/VoQp37ujMnbodA9ZEK0nIyqdRw83Nwtp2CR9vttma
         ldmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901964; x=1788506764;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zT7X/XiN8cWELBs01ki64OmNK2wItsswFcyj5x5QOQ=;
        b=WbbpeihXwEkz35gbaIFfagcaPO2xFTRcq1C3NzfDogOxl3yntTXPN3l/C3/Y9UXzQ+
         M3ik+J5NsEV1T3HxhP+qLzfBJdUn1zA50tNrGak3Kvs1kH/BRgx8C7q6XjkxKelZ4VEU
         RQzUmoiNh+gMmRpEShKTxWPF+S0t61g+HOZ8V2O8rqXb3Kwn+YifAoT/XxM6C20Bxtj/
         POQnlpfgBYaw33KO4qhVk2ApzMaan+q4x4QN1h5xMRBnoIxdcHPn9AbhjTBMAJgNgzjh
         mlWEfHdMJTQU5O8s4Br2MxWpdgqj/WA/Nmbjp1anfv5u0/XzP6RrATm4wnZVWwanAOGJ
         iL/g==
X-Forwarded-Encrypted: i=1; AHgh+RpXVUuKOBChQCiQqRQkNfFt61aCPEV+oKvgrWg9FBSqIRgy1P6OzqoCwq2jJWYS8ZOU7BA3mxVCUkYX4Gc=@vger.kernel.org
X-Gm-Message-State: AFuF++kG4w25kmeOalCjPr4eBIp2VhnAajdwzWPb2Q/Pk4J8Dvr9+OdG
	+PXIcl5Q1HFgLqdKPeOvva+qHugXJISSTUgBhZaD8fv/IoL5xdfZrHK2t0bgyHd57aY=
X-Gm-Gg: AR+sD11sTOXrqMtXhBsBeTyZZqOEqNQ3MGHEadkywuPLHJ1JnVYfW5FFuY2ENF7nqWK
	xvv/fiY2GDi3qoxoFxR1MUzc0m4ElWCE3sWNNdHL1046Ft3hb8FWZZX3SWcimg4HTNpe36aBMJR
	Nc+Kv+m8sWuKP2IZhcUIcRtFLf+31RGsaEsqDJWGaGNAoDEPmCRa2Q97mQhhbI7r8hLFPTJvIVC
	hwp3hnwnDrsVsYOvXJ/8bxJQ1QHSj+iEY3a9RSf8UxU0KtQQSslveNMv/SIg4O5c2S7mBT2bFRV
	KdasXYtFPxQ0bq2HRjzZVfToYZdy2lAozT5eOwitq/KV2YhdYHIo3dN0e7bkJcDe7hZRiXd95gA
	pkNKc/wDMWHuX1gkhOCcNXdaU5KrjIjFMfv2BDAhoip9Ido2IisdeVHOpolRlT01rEaYH5A7tgv
	tpTwE1tEYyrv70HRVFPIPZvMw9fHU0+2u3T1llZoTFb7N04IeFwfIqJTmgS376dAyL9vIS+ySYo
	8vFRiZetnrMdmCREdhGqGlGQEWjNfN3+Q==
X-Received: by 2002:a17:907:c08c:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c2557423bfemr308843566b.23.1787901964423;
        Fri, 28 Aug 2026 00:26:04 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09f4dsm50367266b.6.2026.08.28.00.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 00:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 09:26:03 +0200
Message-Id: <DL0ECN3CA1GR.3P0BIK580UYDV@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kristian Brox" <isyourbrainfoss@proton.me>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "David Heidelberg" <david@ixit.cz>,
 <oe-linux-nfc@lists.linux.dev>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
 <DKUIKHDS44LA.10CHEGZHLQSNS@fairphone.com>
 <20260823194152.501107-1-isyourbrainfoss@proton.me>
In-Reply-To: <20260823194152.501107-1-isyourbrainfoss@proton.me>

Hi Kristian,

On Sun Aug 23, 2026 at 9:42 PM CEST, Kristian Brox wrote:
> Hi Luca,
>
> On Fri, Aug 21, 2026 at 11:28:22 +0200, Luca Weiss wrote:
>> Can you please confirm how you tested this on your side, and if I'm
>> maybe missing some parts?
>
> Cover letter tests were postmarketOS, these changes as modules on
> 7.1.2: nfctool -d nfc0 -1 -p on an NTAG 215, then neard for NDEF.
> No extra firmware or userspace on top of the three patches.
>
> That 7.1.2 dmesg already had
>
>   nci_ntf_packet: unsupported ntf opcode 0xf02
>
> I treated a found tag as enough and did not mention it. I have a
> driver change so that NTF is handled; I'll send it in v4. The ndlc:
> dumps are debug prints.
>
> I also ran nfctool -d nfc0 -1 -p on a locally built 7.2.0 kernel
> (sc7280-mainline, with that handler): no 0xf02 line, a Type 2 tag
> in about 0.13 s, and Ctrl-C with no tag still left Powered: Yes.
>
> I have not reproduced an error after Ctrl-C with nfctool on that
> kernel. If you have the nfctool and dmesg lines from the second
> start, that would help.

I tried again a bit more yesterday and saw the same behavior. For a few
tag scans it appears fine (apart from the bunch of errors in dmesg), but
after playing around more, I again got the NFC stack into a state where
no further tag scans were possible.

I've scanned both a standard r/w NFC tag (ISO 14443-3A, NXP - NTAG216),
and sometimes my Android phone, which also got recognized as tag.

Looking forward to testing v4.

Regards
Luca

>
> Regards
> Kristian

