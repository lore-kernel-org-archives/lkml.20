Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFFC3C988E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024360; cv=none; b=Fxv99rkUqaYLJB2LguG0ZBEkqmdgBeEU2BfgsBrKBzxGr3+gHUXQ0y1NrcSRLZ2QlcKfWRIN22klIDoCl0+9nCeLgUAO10vWw1TGAL5PL2q7LWsZPgcRIqq80csBkNe83jkrYZg9ixhpO860ylSCab+tQmgYCuWImV/A6sPXFRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024360; c=relaxed/simple;
	bh=yk9FkD+JS1tHx2piExJrz00C5iQ7PsL+msSyrNMAWNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hn8o1XSXvDghEAkpDXNaePei+qymyCYfGIQC4xtUyIXthtJq2J5ynHlYMNmr2fODoRSO+4mWG6izrljXTl4kyeuVBuy635SSUYAL9Ini2aH0WHJJN0W7FfJl7MZ+k0Mi8Zrbysnc7N4XpgnrhpcsyXzfeexv097Qr/8B4uP9EuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lyLOGqqY; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lyLOGqqY"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3dcfe205so85186266b.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791024357; x=1791629157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezx4xzy/gAlLbYrRv684J3BP0hR2VYyaFcE+9qMDACQ=;
        b=lyLOGqqYLANJW8O8xGo68iSmAwDLaIr7iTuFPbDIfo2m3lkVxQK6zSmh/9mknGNJCX
         54Y7xDnz+WWxTnG64CWVFVAXPqJwNJ68zJ3ol5qmY+aoeOW9Vf8qf2YHrXNtHuMyFdBL
         YwyEk4yx1fpL4SMVbjgBtAyHz9qwJTBEr7lpYC/eNZrYhClWpvuuWeIcMmg9wt5Jtisu
         Zfd1bEZjBjhwFCK78xkwHyBEnLJA934tfwR8zNiBJeu2ys1+zl0HfbaiE9dbIKR1reR1
         /McgjmBfhu5AMb0rP+Wi4WXuZNxKdaOnDZG4jFCv5lAFDX68Xe03INgxt4Fh0hHl0KD0
         +GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024357; x=1791629157;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezx4xzy/gAlLbYrRv684J3BP0hR2VYyaFcE+9qMDACQ=;
        b=biXcBS6oIuvvtLdlrDgDmhhH9ITqeGnGX7jvV3qALOJpoWoCP5oByrjA85EOin5UGW
         v0W3ZVAe+yZWpLfIlnEGtb0o0JDMDHAwLplLyS6XK3DK22LiW40sDUGkkjPds+Sb4wfj
         PBfvtUV28fz1uOiQOS+xtG850R7UXwW0u6S1rnzvLVMs3Gv1uE8yGXSNjCoaQt/SpDKC
         0eArmKHND/1RlOO/aPJjWFHKSI3xvHbWWOTMoltCdniav+u3qRkx+dlpyvBhKCurmzGU
         7xw7YbJQYRdp4KDN8EX1syfVax/Md3eTea/CowH3seYxIskSxOj2BUCGidqMIg97ZBoM
         F9hA==
X-Forwarded-Encrypted: i=1; AKwUvByop9J3aEdzMxolWaHTbTY/pupT3Ku5H67zRFhtGM5zAGGW0xQvdqdxLD1hAEAVCOGneXi2MX/ohVm4dAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhXP6SPyLtrGYPL7thY8ykOQ1IW3aKLS/0UJMnQOkF/GhsQPk3
	MkLtqNy4Vuu0zD6XdFKQuIwLfhc0eKibG8tuame31NZFmyoeCKlPsFLXGwlKO2Ouzms=
X-Gm-Gg: AYBFou37Eohg7et/BSZuwY4iHO8/1GirqE0p80xOe6pziijo8t3fH+ljBhefaSLuS2U
	D0cgn7goAsW7zLGTj6ho4eSVVI07YhQbRDp1Sc8MS1D/W6iTtEmfms4bBICwREpRQhbGZV2dr1x
	tRzSTD3sIb5ZG5uKIpZLU6EtsXfd6EEY04iig0rXvYUYawgRMyenwqtQHXTLQWvQ4Yl1bOwE9C3
	JKXVEQgIGlEGRBnkWcfy7RPO1mNssjhGA3S1zYJBuiZu9VvXYiHumgjrAaH6O2GIrWJPDS99aFy
	Y0I1Sokgd8AduC6lI39xojz/x1jAFH0LWwwgos/97b29kVmV4SI/RDEgciCjS69LpAnJNdm7yzZ
	de40b/pLKODaGLha6eCTkfuXfM5VHth8bYsHtEfKnRM0Jcu902mPrJ9sMquD2b99SGNEYw9Ke/w
	58XzunX38sqyKFicgVhJVZ8gXN/97lBUnyCCXxIpvrxNsZahVlx6y4yE17484sRLEAoqCQdbVsl
	VG91Qwe0tY=
X-Received: by 2002:a17:907:6d24:b0:c2d:ca8d:435a with SMTP id a640c23a62f3a-c2e4af80457mr432580266b.38.1791024356730;
        Sat, 03 Oct 2026 03:45:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd26bedsm186675466b.34.2026.10.03.03.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 03:45:56 -0700 (PDT)
Message-ID: <80d0d390-a0ca-452f-b8fd-a7da85bdde92@linaro.org>
Date: Sat, 3 Oct 2026 11:45:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
 <rtlQmJQ4ykTc4dV6nFJIqsjY7h9hUEOCFQETkvIiKG5GSaRI0L45Rmi2FuzpULqJC8hFjPE_3D4kyuRqgJNOdA==@protonmail.internalid>
 <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 11:42, Amin Gattout wrote:
> Document the syscon compatible for the General Register Files of the
> RK3576 MIPI CSI-2 DPHYs.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>   Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 7bcb4e2f47ec..e94c83d7c138 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -32,6 +32,7 @@ properties:
>                 - rockchip,rk3568-usb2phy-grf
>                 - rockchip,rk3576-bigcore-grf
>                 - rockchip,rk3576-cci-grf
> +              - rockchip,rk3576-csidphy-grf
>                 - rockchip,rk3576-dcphy-grf
>                 - rockchip,rk3576-gpu-grf
>                 - rockchip,rk3576-hdptxphy-grf
> 
> --
> 2.43.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
