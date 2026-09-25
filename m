Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359FA4CE66D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363968; cv=none; b=DwZQgjbWVtQqhC4RlSxFYWtWs6+hvMrH0aTfOIPkh2/yJE0ocHdMxNZLKNHJb+aPLvybGoDP1QHzc+J7fMEbKoY3BUgnYTNFsJP3SMnXkG3bkoru5reN0h1iUh4AD5VU/w5SiyfOJwbRmg22ktVpLDkewVWJ+0gmyp0o4vvqFRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363968; c=relaxed/simple;
	bh=MQT39MSNydZOoQLfZLVQEPg1603ry0TvR1TtvSQECZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZWZuVzMKCurebkZe4LP4b60tY/FPJl2vrDlQUQCNWofiXvVXPsPkt+gGg2yI0ceQgo+uzcXrQz0pVOGIubXF1hMe0WCjBcEa3Lj0rfzIH+7Btj0g8g0cXeRxe7nNNktCj472SpQJO8sC0Kinp+QqGF95VTy3W7+QF79kZ0nfyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc0nRRdl; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc0nRRdl"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342568a5b54so363132eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363966; x=1790968766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cVQAurF+MYZJ7WaK0MhKpEumwF6uK/6mS+d/0X+gZ3g=;
        b=Xc0nRRdlq9Nl6Ixk9/tRe/DWFp8LHtdb3YHd+TrJrDZFahVtjdCCx1n1uhksP5F5wW
         RxIh0Jc1kY8f+fwa7zzuoS4R3BRdrNyZVHCAfoMn2S4XNdfrvjv8PTg+Pn5eHkGpPmLd
         yduidtXJZwK7KUGu7fHRzlwuQrNKTmxz5gNGpA4GTV7FYBZjNvMDtebj3ombpAzFKUuU
         5DxYX8eZfmI/OchqqKDrcx2+Cay3G3uROGU9l+GkNWo8b7UFijIG84fZ5K/4AzM+6A2c
         bz6lDe4pOVGfP2BERnjsI81iI5HHcz+YoeC1qDNWwRSref0NvIpzXVmvgPLT45BlZWtU
         5TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363966; x=1790968766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVQAurF+MYZJ7WaK0MhKpEumwF6uK/6mS+d/0X+gZ3g=;
        b=XrKYl7yjOAP2QF0GUg7eFNyOjLHUCa9eymJ7D9L6PzcaUVmKy9a7SdlztmIZWE/X+t
         wlBfCaS/NSWIh2wEGc3ZxilrLH77lMSU7qGXQAPntQ01MvxGoNzcBkCyd0i/qG1yzs90
         p16r8K+lfHWaMK0Uqf1G0/Vb22tBHjxCYxuRCu3NNIeuzNdn9XGODWReOvePFXz092tY
         NGxGF1G1DYzqdUrZwKrndIaRGE+PzPxlCg56ox7boIwe151j7Q4KbpX6X55iz6T+e94k
         G9GCqSJ4lVy9ncVuhFAd7Zr2JD51pW9OJklTQbr13QmsMidsXOH2zqfn7P5lEvtkjLj6
         g3Sw==
X-Forwarded-Encrypted: i=1; AKwUvBz/HI4QTQUD3YKSB8eiOjPz66V6OxS9hLCZpCjtKG5KqT8AgskwQMqFLJWCh3t2Sr2dL9qWKdjbRE9agkE=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ/uo/dB9MuZsLGoEUEtSo8iYMNBtw3gPDYSz+KA7UyVCRn4xO
	+W8aGBKA8EAXT/enRjS4d7lKvfHTcm5SIXKd13Be2r2Ov7YpFQwAQDKF
X-Gm-Gg: AYBFou2Z/Z/dWOilnm/1IhT/kr2prXTQ7i9a9AhytBzEBkxtJXanDjVQ+GoFp0OVzrn
	OjxCegZMgUqMAPlxP8YNk8G2LvtygmRqQcXbNrcjD+kEYfXfJeL+j27Eb8jy0oKTB727V3hm9gS
	Fyn3OItFcoCLVUXIFGFNxS63pj3sBYCIzVuk5R0rpJSYCtD2DUxGJ2VFui4OQ8rvJUWM1Sf1idM
	4Dl1wDVBQFdYX8vFlIp6QGPlKAHIxY9i4+o6DGJ2MtS0Mp9B0LJrd+YD0fZto9w75zJ35NFM1Jt
	bbEPoUs6QUGnW1eMYHO6JhKk43RI4kXqiZXpKeUMnNQoKAb6OQCW7vaqyKByhqa0bAaSiGkh5Gh
	gxD94xm3FktRizT4eTgCvax+/KVsFUGnxk0QQikns6WPVrFlPA0ZESCjTb8bY9Jjqtr6eoaoFpd
	GnRT6Nuj1F3BuaMM64rvvn2R95H9xeYysz6jTqNDOLKdEHbeYfiP40W0QzQvujTzuCGERaTq7fL
	s78kmGAGu1Sn3c7XMaak987KM/pQSP157CXaTg=
X-Received: by 2002:a05:7300:b193:b0:339:7e66:5c9b with SMTP id 5a478bee46e88-34271d8cba9mr957272eec.23.1790363965982;
        Fri, 25 Sep 2026 12:19:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm7509986eec.0.2026.09.25.12.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:19:25 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:19:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Message-ID: <arbIsdvRzPCqPXfs@google.com>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-2-4a53381cd038@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-2-4a53381cd038@ixit.cz>

Hi David,

On Mon, Sep 07, 2026 at 12:50:20PM +0200, David Heidelberg via B4 Relay wrote:
>          touchscreen@49 {
>              compatible = "st,stmfts";
>              reg = <0x49>;
> -            interrupt-parent = <&gpa1>;
> -            interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> -            touchscreen-size-x = <1599>;
> -            touchscreen-size-y = <2559>;
> +            interrupts-extended = <&gpa1 1 IRQ_TYPE_LEVEL_LOW>;
> +            touchscreen-size-x = <1600>;
> +            touchscreen-size-y = <2560>;

Krzysztof questioned this change. You need to explain why this is being
changed (and potentially split it into a separate patch as it does not
seem to be related to STMFT5 introduction).

>              touch-key-connected;
>              avdd-supply = <&ldo30_reg>;
>              vdd-supply = <&ldo31_reg>;
>              ledvdd-supply = <&ldo33_reg>;
>          };
>      };
> 

Thanks.

-- 
Dmitry
