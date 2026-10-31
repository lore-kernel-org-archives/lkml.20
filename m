Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463875;
	b=wWHI8QP08MiH+CrRjadLIfUhtxYlpfUUg5j3UDX9wy5JcG5qxkdr7SB7wPExTD8XPq3k
	 SSg/FMa+DBGoVL1RP6k9zNkk+mUtSW2sdiIl5EgXVC100vnqOd6fDlG+an9xODI5PHeKn
	 IJs5vBxHG9+bb+//exeXMqKW65SHukTQwa/hqbnW3ULpa6tooRj8+std/8hFBjo2vvMrf
	 ZD5Az2stkuEhzEaZetn52PKq9RtUcap027Tj2CJJ2Go6UuN63K7xV+9QXsjje0KpS+EHn
	 Q9tRCoZceA7wMzrKn/axu1Hb7hoTeay9wxNW60Q6epDrenQAyyeAoddt65WPbwLDojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
	b=14c6R3QvFFRsptK+QXwA4QqcMPlSdMCNpBZ4zPR+pt3GUJECXBeXxA9a1HHSohvfG0tM
	 FDVbVozl2cotk8XY6MZYdUz8xj5Rg1FdnB1RiE4TAxyx5y2rikfIRJlEMeFpW3uC5ui+6
	 VK8lsfcXz3YSHJrf3P3QWGiC6wpPkFxkoqEAVdLKdwTIGiAQw/IH4FzqwnbOWxdgwl1T7
	 MK1cvBhOMbA67wnUcmdfJxbEJuqifZslcNJ30YF1SxFcVEBBlotShc4uhkov8gp77ODuD
	 Co/XEGCJ2Kahm/gzDWp2+iAf7VVpJLuQS3kBDWCHn99fdiGE26cQDYj2cTKHf506QVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOSMD9fU;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30659606A323
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30659606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOSMD9fU
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5364648ae07so18250481cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463874; x=1794068674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
        b=NOSMD9fUaSlnnAVs7rDQzs+EGkLJpl98bLE6Mp6L+MVutT9zwJaazzQNB8EAK1qifs
         bBwwM3+WLfOICY3Is7k8e9GZ9J8ydKWjTqNqv3dfYyGA6d6MhYwNsR4IwfftTsOoXr7N
         yOdhx6IWTWxDVZ6lhsoPzzq9bRhXCsPl8T+iLhNsvHxBSzSoDa5r77nD0JplJm5EaH5e
         WTG75zqArnuzvweE9XoFWOtZfUV5VHxjNTixWsaMVJZzWz/6eXhsSy37tnxN/8os+LU6
         G1ac/Van4gaAK0eTWbF/qqg/SfXcLSCHQnCzEVuy6B+TGr5AA4A+JQV6l2BowGrmlYYO
         2lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463874; x=1794068674;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7vIh0omWnaIKHlyuOp9GFFfcNaXC5AjrWL9J1CqIMk=;
        b=qngGR2N6F4HB8u/sdWHpSqBJjfbaNr5tqqd0FDURmr5iNoMq7a2Y+PCTXRBLh5zmXD
         vgRonfJgAR/YLLPke40eXn9uF4ylnS73V5q5vYYmtItLBcN3Lz2DiRwpLtwiw0lFB3ld
         GCw+aSbuN9pZO9AdUOxY0eRZ+pDNvtKmULq2iNsYlvGEcUlolG4FR9qk372zkPXRSbQY
         9whcvBAcAIBvwBRVwvaofPxRvR4bms0mAN6z0OQg7PVa9pPydKKy0t3Eo7MOeKQl3m3U
         2AnxxI1DMWxMJRE1mGzezlk9iwrptP3fmLK/fBzu3SoCtKcEqG1MVvDGmJymbF1w4dJ7
         hYDw==
X-Forwarded-Encrypted: i=1; AKwUvBzvFAze6hH936YDgC662qUXv+TO7EhtyHjqkEwgJjONcNchWSFaT5IIQz72RnkYACZlAyIh9oFldWCrbfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6XVacqsDy847XiZvqy51yzSDfn1TRZMkOeFBcqexfImRENuOH
	P1MlvtlIDbKD19QkgLZtOHR1CHkanGM0xyO9+oJO8oISwl/hQ4HeF6sbOI3jPng1hkVfqw==
X-Gm-Gg: AYBFou3oSE7SbcpTmEhCMKNH60wJrjGemCHRG41dUyk/Mh5LQufTKhQpHAeQBjEkxYu
	a+qwjbs9YskikLg5TyXeTsEWH5DChlLTijNbC9J+JgDhmNq++g0xsNyQMd8QLTt4P62hQJbtrfH
	qKf97mzzynLrAFBkiyzN0MSwuZkUfmzp7ksKCvPAS02Eoqrwg3Nsfx2GSq9zYdEmqOFI053Z5my
	MN+2nN82iOwrTSdynMzen1Qda93sfpbgp9c7CxCnLpIzh06/XtUMIVldZMRUy1Lr8BjoOD71Z5R
	g+qm4xy9jU0yGWcbTT65sOE7wfzu8TPvVuwot9J42Ylh0SuxizGzcqty+XkSJDVHGVxUfk3qIwh
	IP7KX7Re+fp9fxUrZcX23svstPEAQ7BfA4X2G8JaCjmZ/u7cgnCzpXoSev7gNjsZ7hJ2/0P/BAN
	mpwrWIN/vTLFkmYioKr9nw2BVKSgHgAEIyqd0im4Q36rDc1gjhmNb7h7ibpw/VdaX6PPJvZvIHl
	xr/NfeK0ntXuoJg54tB9gpu8N5Mlif/EOC5Fr66nP4rFngmm+RHSowPrMO8IpCWK/GFdKoizun/
	bHzLV5GCmM0hZSqO6zSHdiFM/ZAElEPcnexcZwWJiXymjBWCCHXgZuBdgocMn7f/mtc/ETux7r7
	9nRFpng==
X-Received: by 2002:ac8:5f0f:0:b0:536:6378:c805 with SMTP id d75a77b69052e-542b7b0a58emr89957211cf.51.1793463874088;
        Sat, 31 Oct 2026 09:24:34 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f47685sm45340756d6.18.2026.10.31.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:33 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
Date: Sat, 31 Oct 2026 11:24:33 -0500
Message-ID: <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

For 1-3:

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

With the PM8010 I2C series v3 and an ov02c10 on CCI1 bus 1 and
CSIPHY4 (2 lanes), the front camera streams 1280x720 at 30 fps
through libcamera. The A16 node is the CRD wiring with ov02c10;
happy to share it.
