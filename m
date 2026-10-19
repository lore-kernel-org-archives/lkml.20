Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C74E5341
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414655; cv=none; b=O1n2geoH8xe8/ftixh/DbSPm7Ud91gJTGsDvBdUIb3QQikOz0mfGGRoaOasTUuN0HU2d4kfUCIqq59pPAV1u186rTwCFzh7xq0B0YgEkn7Q6fwDIXWPl/XtEcQC7A+2NfQaKUiqFJbtJrrSDDJN7RGVrVaVluicT3eq+YCsBA+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414655; c=relaxed/simple;
	bh=DPtgRhzyzAeLmGS47IlPoFEDwn+LdYIoM5JOg6vn1jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAzxsX9THwcgLf6oX9u+OZgaGyBGHuuwM124tat8sa0laUsK/PeZQ7Lp+43Q5mv9iDLfZQfw58fGn7VdK64KZl/u6J/p+jdPnVPQuFhZtAszwvC2+Ndc7m4EDaFTSnx7uLo2benRlt1wCbGv6qHYD7I5SV6vjyR0rNg4Aoj/0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaTdNt4o; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaTdNt4o"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48de72fc832so1562613f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414652; x=1793019452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lf9FLL6T5/Kb7gEctiirso0+WOoWDflrhqqlYLNOZeU=;
        b=UaTdNt4oSh9tXQFDkjdXsFnCBRqQhVDjFVJE/FaqQOT9+of9Ny7rpMMZrdMSV7s0Kf
         4RusC9VjHHubQzgj/bGezsMkzlGVi/8V69ledDOWvB5C4Hjrb46wqVy7WeIRRG+r0sIv
         okaZGZx54gZTKPr01JZfl9RAer/vNimHubJ88/+pHpR6bgPHjDGnKRHf/S8ZxUIsN7L4
         rkcT50oiASX+oL6WmOpTLgwNjpBFhYUt5S/UIyMgBULFJp5a83ASOaBfA0G6XtLlRb8M
         i2BEU/xVCDQ9lua1KKdiuSSBKqR0JfPgt4HZA2ODMF9kqZPbku+7zgWJ1hShJ9hbl0X4
         kFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414652; x=1793019452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lf9FLL6T5/Kb7gEctiirso0+WOoWDflrhqqlYLNOZeU=;
        b=c2+vggdrJCTcUHz05I9wvz/eFgMUVgS5+v8uiB5NLfxugpLBNzibIBR7GcvJKhAELt
         wHMlp32unC0uO8QCPcQ9TUH3VMFuvmtIfz63xl29e3yeZZGuoTK5SjcoiOh9AU+V7hhn
         Cx7fduSHdrpvksLjV7yJrP9mGUt8WFbuzLpRva9RDsBDHL55Z7s4z/angovSx1GF3+io
         KrLKS92ch9C0HmTZguCmzVrBoBGCRqRgdUq1157Vx2XJgtzDqaey3NpRB/UM+XIpPFS8
         mLzV443HcGKvgdM+mggI8LMPEYPiIUJC1HGNZ1NkJJ/ikXns7V8yJUxlfRnUqIrRzuc6
         oGTw==
X-Forwarded-Encrypted: i=1; AKwUvBzOBg+TrevGomEhsLcYJkZOEgXNzX1BiTAJJ7j49QWZwWygBFZh0vDUXPGV/olKtJ5iouLWuPP1h0aoS+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI56y+fxqBK+0SEXEoNwXxq3txHTcf2ab0r6sgNM34lyGbSjsTS
	0JV3/98zU4BRKdR/6aoUDMtOOWW8UbAQpoOHvxDWoLSgHPkb1q9El3wa
X-Gm-Gg: AYBFou2Owt3HSXjH6AZqW83AXXgI0hyBPb2LJWj2P2BmXV5kALzN9mO2j5UDPcHJgJT
	FxAM6hTH2aAY+VmIEsrcdOECY8KmMDwpCvsP5BtcmBCkKHGK3GDybiSprrs0DWT//qe8fGF2k/C
	deADGBpSxJeGaAJ8ZqnXH39w5TRVQlLwDJRynUIleq84xDdS1FVECAqhh4E1HvfuIUwzFe6OSGS
	fNOw7MYT6Ug+cu5g6MZWYnuIzB3nceMgMdn5A3D9gahRn6CJh7rCoZsR4zuiictsDJVpLOatIVw
	5CXgC759sHOSMZceESQcBOiJQUmpcDa7lO+NnVUa2GuMQIR2qUJsDq59GKKnz6hLsstwqas2br2
	cIb3CQwUz8uJlqyop+2DFqo2OdWfJqTvluI1TkAYSfJYzSePzgW9btwLb8JKlY22pT+ITERI/0I
	v2/f4Q2Ep2tzesNeXJsKFbZgN0BatO3qv1wl/EC9gkhpWYTQFhPzmI4REs2FYINlGdp5ue2tAHz
	N8OBvTMtR/B
X-Received: by 2002:a05:6000:4b15:b0:48e:1421:ed49 with SMTP id ffacd0b85a97d-48e14220c4amr6571820f8f.18.1792414651426;
        Mon, 19 Oct 2026 05:57:31 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdcc0f20sm22643828f8f.11.2026.10.19.05.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:57:30 -0700 (PDT)
Message-ID: <2c73e54a-d2b1-48cc-827c-6c29c6664697@gmail.com>
Date: Mon, 19 Oct 2026 14:57:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Language: pl-PL
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/08/2026 22:15, Dmitry Baryshkov wrote:
> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1

Hi Dmitry,

As requested, for the series:

Tested-by: Michał Szczepaniak <m.szczepaniak.000@gmail.com> # Motorola 
Moto X 2014 (MSM8974PRO-AC)

Thanks,
Michał

