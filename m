Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805366;
	b=yRZB3YxqixoYU17nnWjvRgJlVrI4wxUNm4aQpy4N8/geexTttrwjesIhs1TZw7M41J4G
	 qCfHfWYUv4gj9A+g8vKQFaHR9OyMO2JjkQtcAiv0QJ9sk+zjzwAk9Sz47LDWEulBbPr7y
	 HkvAHzSvfTMzhuaLXpIJN0ArGKx2XJNalsKLUbPJLo4IwIRj7FA15guSngZ6w4s+xQDd6
	 QATZElUdf7UTpHMslEvVkNL3LScRZdSFtP7FeWpaiKqNG5TUw8uP3JehvZgEFy8u/fbTY
	 prev9br+rS4x61tWbyJ8n0a40L2Q9K0NslOT0FLvSY69vZA17OKoJvti/O5wtd9aGDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
	b=4EQ0nPR3d5HL+NvIWDFTsvQ0sekiaoT+K5ScKaj4zizYYlGRc3innKjzP1XyCVOephWc
	 DwB+c6dsKJJAHM22YtCj6BvUbkas48jp/lrCRnu0GxpGnU0NS6F8OZaWyPB0xP3C40+i8
	 qsNTzXceHioUBxkKQdxnzYeHBm0jUQO6KTkWC/GxqA+8/kW/Ie9OnQpa7B2+4yb0LoxUP
	 2o//3TtH0O9bgB5mzCwrQTAeAB0kyAvXlL6Q1sFmw/GoZ90zhAV1FpjEeju2b8kdJEjRO
	 Ha5l4uNS33UkZtg2AWJwJOBzcDG8mf9/2MThKXzxPXUTPa+iP7qqecexqVYc4HeJ5zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+gajlXC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.132
Received: from mail-ej2-f4.google.com (mail-ej2-f4.google.com [74.125.228.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0661B606EEAF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0661B606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+gajlXC
Received: by mail-ej2-f4.google.com with SMTP id a640c23a62f3a-c4cd284c63bso57883466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805364; cv=none;
        d=google.com; s=arc-20260327;
        b=eH4s0Nz+25krixCfyWl5iykXQ7TQCSS7B9CjkyhlG61TprwA69DzIWoc1ddNTUTfjA
         Pd7U7CRPbwT9y1LuH/xiVbDg5y/g1Ntq6K5hHxlcickUNeL9HHP1oexZ9NdCAFnXDzdu
         6Yek170DCD5I68bl5ikf/Nu45O9Qd8pI6JpUPQSnzSqQxEVTW8cOFdx5Wval5BMBYif4
         ZJbNSqdD/UonO19xvpZM4D3BNKv1/poRBTXR13h7TRqJDHqx471eZl4BYgnLHoWe0Dky
         +Jnr/FyZ6uuXm/CXS/QA/8vt/0ka5pd/Pf0VwSuPPcqgxYGmB6rlyiX5ZGpUfew0JRzw
         MN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        fh=x0c3lgs4w5Nmbrspnm/nNoImJU97QciGro58BIRmplU=;
        b=mv+huNf4Cw64ppRHg+rMeNeSYv4CCNqYRqM0yhQ/u7vHQi7t7sL+j8dzKYVni0ZJrx
         lo+SAsFDcGhPee6yNPEBnyI+LTmP68qlHo5inofL9SBWfflxhCZXtOCIQ4Y82VsqPpDW
         nr/k+ND5u6ObSQmIfz6leSP8eh5mVXN357zfQahSL9Czz6eWD3BSrUp8HmDIvAVHc+Ty
         owd8VPFL7q0AlUFLCouaEeL3gPyEaRvvrxbTsMDrYkZIFQ5vGSmJWnLsZGu+493ZwbCE
         a0UrNu6RCvm/j3LpcytY4ltLt7qizkyGqdPBB97NtaOurMsh7w0rFtJVaPzZgWCe8m8S
         kMow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805364; x=1794410164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        b=u+gajlXCNeu4E/N1Rfx9lpm0Dt1PdqFXsWin8HmGWdHv0m5MS4a36qkhEun0FbEaen
         br1BcgqE5tp1xVLHFtz9cWTPjgdy0WZK3bD8tAT7OkV3sgeF2IFaTjOeTYwXcuW1zOHL
         +6wVkSucFztQJhCk5DomsSKNt56EAFiJO0qfWWadtQC6Jlv9GzpzP2D45N/XuOYPPaCG
         uSH4Rhvv4a1yQIcjZP4deRe2if0aMY5PEMFlZ73oZAM8r9XmM3EP1MOEzWV2wMcnsofd
         3AOM6FEOgnGneOY1al3Q3kK7DIvdYwG2H2GLtQ//96nDGpKFnHOXJbu5uPUlbbH8fonV
         WbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805364; x=1794410164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        b=hKXpEDaw+pdjeokqAluRNK4nX45gbRjkR/MCPZWOEb9Qmf0vLReJlZoa0Ao1Zg6D5B
         XA1kxQwJMD0BIszxZsxraG86zdf0ZQ+C67eNGieSnxf9c74no6feb7h458yk2rnVkuAE
         /BVFjPA7Gz96GxoT/34iyD/upeCgCsHDQ6vSXsk+icdVUjcxurDtAOLvx5tDonOjEuAi
         7b9pYscOFwlOSyH/vv39cIaeO1II9KxgBpB7JuWoZQ2HJfqV0uJF8SOo73aOk+lST2yU
         ww7yHK9OxfBDDl+TJfVX9KPJifjGxjOXI79UEZyFfLO5Rbzy0wg+bnixcaevKeseCMvt
         HWXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfvLde/evPNggjMuewZYCwZ+8WFfl07oOB43EKHB6FV3jsNq0be8/ey1OBMcR36rGWPRMW4tk9XaV93P8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8VzcCLCct0k8/SNKJPHB3ErzLbCRBTqMTKrF62xGHQwwW0NXI
	xPXbz7A0680PWMSCPC6G4nE7r4di1JV+JgA5lv+ufN3g4Zdj7zJGQ1VXaJFENWbbyEW97/ZQN21
	oytsLmKwOh3qsvRDP+H5pUcLgo/XxY6A=
X-Gm-Gg: AYBFou0M45n38F42QqjgRndZj7XZVg9foj3p/XFOB2fVtsPN4hPXVKahDHFBHfqLAam
	GwKATjS1PwXO6wXRIrtVayUYVj8u986TkjdXMfIh5ClKTsVsPsl0pTAY85Z0PV9mYTkEzaQxVKD
	7PXLaMxi3XpcfoEyfyfTw7nef96jDAQ0a52ZSSRlPjdsQIx+jGPAcAkxNxYLHZNkbJs/2BomcWM
	xJJYLnnhKtXB3dOeGrUKoDCv5VUq91734UgwdbCqm5hCmjocQmHyPpa74TKMbgM+AddNpkdvQzH
	hiiVHK8Q3fTzvuOHUtE8cq5laDt8kBVwPWNlYtLE8eynYPw8nArPFfFtW4M36o01K9OhWxEVr1Z
	P+wGyo7IyrvA7QioMl6n7LpVHvEs/zBvppnqC9HEKg9Po3u+e+10WmeU=
X-Received: by 2002:a17:906:99cd:b0:c46:50c6:f737 with SMTP id
 a640c23a62f3a-c4ca7a8459cmr1547068466b.31.1793805363810; Wed, 04 Nov 2026
 07:16:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102174450.3000397-6-coiaprant@gmail.com> <20261104124020.3546166-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261104124020.3546166-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 4 Nov 2026 23:15:51 +0800
X-Gm-Features: AclHuK-zeYM4UdtsZyf6UCuVcNw6qYpttvJKvduU9hQNxft_dHREd_O22uUfBMU
Message-ID: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on
 Photonicat in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=B8=89 20:40=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > regulator_5v_boost: regulator-5v-boost {
>
> I prefer to use vcc as a prefix for consistency.
>
> > +      * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
> > +      * and VCCIN_5V (via D16).
> > +      * It has no enable pin of its own.
> > +      * Model it as a fixed regulator depending on the boost converter=
,
> > +      * so that VBAT is boosted when running on battery.
>
> What are the benefits of doing this? This is not a real regulator.
> It is the same path as 5V_BOOST. D16 controls which channel the VIN
> of VCC5V0_USB30_OTG0 comes from.

Hi,

Thanks for the feedback.

1. Naming: I'd prefer to keep the names as `regulator-5v-boost` and
   `regulator-5v-out`. These match the exact net names in the schematic
   (5V_BOOST and 5V_OUT). Adding a `vcc` prefix would break the 1:1
   mapping between the DTS and the schematic, making it harder for
   anyone tracing the board power.

2. Regarding the 5V_OUT node: I understand your point that D16/D5002
   are hardware ORing and there is no software control. However, 5V_OUT
   is a distinct net in the schematic. Keeping the node makes the DT
   power tree accurately reflect the hardware and clearly documents
   that both the USB VBUS and HDMI 5V domains share this OR-ed source.

   The `regulator-fixed` binding supports modeling always-on fixed
   rails, so this doesn't break the regulator semantics. If the kernel
   later supports multiple `vin-supply` inputs, we can update this node
   to list both the boost and VCCIN_5V explicitly. For now, chaining
   `vcc5v0_usb30_otg0` -> `5v_out` -> `5v_boost` is the most accurate
   representation.

Coia
