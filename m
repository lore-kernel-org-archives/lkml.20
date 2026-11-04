Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779968;
	b=TA87ki4rc2dLk31VRYZyIEmUEuInMnE2ufP6uZ+3T/+i7y34yEz/ok0+Buu3u31pHiNH
	 DJU35sOuI8HXgC2TmwwvSs1OIwrw9klkGEHRWdxEUWGWrn1Srl/9tNnGnvQmrIRbckcqN
	 v3XXPyq2OHlOJRhxgFHFXFab9OR+u2FdUSGz2bsdJ796W6SPDHNee2EjeagKRVND/+YMg
	 gz97Jw2m1yqunyOVuhRBZsf7nPoSaXXlj/x6WIh0sdTjnZxG92M0C8eLQr+iPdzAa51N0
	 UsJZW4P5BrZvYIodTVSzDBKug2bbyLpEiglx4dvtsG7RLkyr6Y5+RQvMK3/mUFM7ePQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779968;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cKut5OAiUKONM3iHS+1YDi+YY4g0+XmlVgC+WTr0B0E=;
	b=jtJTHU3qzJuDCvj8JrukxwpxKrKb8RgQ2BGVl2tSdtEL89kBpgCVCeskIAVYV/fWjoOD
	 bZhblFRZ+wqwqVJ/18IsxVj/eygI03O+xClYhY9yvia2bXO8w39OHVUf5V9imp+hsEFtO
	 rIclbC4K7R+Ikbq9z2i81uCDmKmgF9PKRm1PfZySKtwvZFJDzNq2zbYzd5xfqefQp1Sw+
	 FHDVUWTMbsdc92xchuSMe7HIKL5a7iFQJ04+W4mAKVwuKqFH0ECFLSGcojMiRpe4/OtUb
	 92mqWy0xn+OOyrgW3hvTVpbyHe/lNb2vx+IdYohN5bxqd6CK6dgUBYmm6Q6ivLftDjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/B1s4Rg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E1606A331;
	Wed,  4 Nov 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/B1s4Rg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842331F0093A;
	Wed,  4 Nov 2026 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779967;
	bh=cKut5OAiUKONM3iHS+1YDi+YY4g0+XmlVgC+WTr0B0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=L/B1s4RgVFkTXiqaTQxmCJMCPKBoTkmlVD2VMkNePJWW23AGNTwtrQwigo3B60YBA
	 QwkFvcj9dEqpIMiXg3eR4uj7NzgBYvkt2YVlf7pQ3fyYjf9Yo7MVcuPRcQLyxHzDyz
	 MMza/tD69dPaGWlluMooaxDrYGhDwmIhNBAp4DHkgo0mf3CgYW9VUEAt94yo7Ar4X/
	 wlABDVbhux2R5tL/EUp5Bj5rxg0DdsPuKhhmfUcu+eiyCu0rzFYjqfDCDH/+7InqO+
	 ihrq8Ru52R2vejOBlPoYsnsNHb+NynUKpE5pAJE48Yb7vmJPXlkzd+MVjHrEJdc4k9
	 zAAkZzfQDvPKg==
Message-ID: <4698556a-5afc-4343-9223-d0c1430edce8@kernel.org>
Date: Wed, 4 Nov 2026 09:12:37 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB
 controller as a Type-C mode switch
To: Joonhoe Kim <26rote@gmail.com>, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 krishna.kurapati@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
 val@packett.cool, balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103135057.1682-1-26rote@gmail.com>
 <20261103135057.1682-4-26rote@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261103135057.1682-4-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2026 14:50, Joonhoe Kim wrote:
> When the USB3-DP combo PHY is a mode switch, DisplayPort pin
> assignments C and E put it in DP-only mode, where it stops the USB3
> PIPE clock. Make the USB controller a mode switch as well, so that it
> moves to the UTMI clock first and keeps its USB 2.0 port working.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> The "mode-switch" property of usb_dp_qmpphy comes with patch 3 of
> Balaji Kalkonda's Kaanapali DisplayPort series:
> https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/


DTS cannot be combined in this patchset and must be split. Don't mix
patches from independent subsystems when you send something explicitly
targeting only one subsystem.
See also: Documentation/devicetree/bindings/submitting-patches.rst


Best regards,
Krzysztof
