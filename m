Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB439426694
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708995; cv=none; b=SahdWb4MWZ/2Mi0lY731IcjkAhR+zH5RcB3ZISO39u9Vqsx8vIT0IXODGX+0ybtMOmrfzgD6Ta7lmfKacNTwefDEVr0EcQXyFPnHjVTk3rdOcHTCurYuYgoOvGYITjKEbawSUrhq4zntPWLwllg2J34KiCFIChzlBiJc+9BT+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708995; c=relaxed/simple;
	bh=trXuCyofDSoyesvjUgDrKmbXdt/YLOeYazvd/Osj+lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eirA1mQXsl3kwKS8LhowpEuf7Ivgg0D14PUXBigr2/bY5/98lg+H1M7aiMy/UuhS/xBYIVUc6pbAs+pbxtHWXZodnSTVWg8gZ8EKdwmXnxNnnT4OmhJQKtHgy93cGiqJTO1cxzlouagUyHSUXM/MrKZODeHrL7AZfGDzIE0DW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCf+9AJj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCf+9AJj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c263415982eso119496166b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791708991; x=1792313791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKOqZxKxSOHNw25+e85CqVx4B1361RF8kK92P+D5pVQ=;
        b=HCf+9AJj68FQjIxYxllcXMPh/xLWNhDxiwo2416kSNqHz9iEkEonTNZ0QTH+Yt+uWg
         +vJGQ4ibw2DaCwgZaaBa822cYfUtKvqeK9yPyjgXlGRvkCsqD2kHCUJc46s+qrWAeW9s
         x0CI+g+36a+2AANQEActK1Zog4eQuF+G9vtYFogZZnob3kMx2EzHaHQ+dVwT2NmurOBI
         Mf9FhnqzJHXeY3Y7TTnqbwWE/lSmHy91caoz52tlv5uo8QjI2autT/HQ5qF3UTdLoZOb
         bCLBrRViqKctlHnPtoO3R3qJiYsz+Uqbox3IpsXQFHlrFt+anLfctQCEtIs608+sxEU8
         Kkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708991; x=1792313791;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKOqZxKxSOHNw25+e85CqVx4B1361RF8kK92P+D5pVQ=;
        b=XP0fAb4FQZUB8KepMAYwFWeLNp/fGS7oTjh9FcJicJuYwpGE1MmIOxyAgyMnU6ieSf
         gHI7O4d22swxwWea1ffAzDdhfyLUKBr3VSX8Bg2Mb1eXMC0B3vjk0J6OxeAlyVzSDiOc
         eX7xgt4WP3Jhnn+MTl86uZd3ITMeqGGS8oIpnNZEYXai9JyQ3O9aul5zaAYjJ0EG+VF8
         2me/vtNpb0crw0R3yB8eLgcTjGCy/SogL0QpQLx/+wpIbtIjW6mBL6DAsV0TigvjYrxY
         Zzt0F77Gs8ClPVxkAPSHoN9TTdIVOh9AzrmbrWP9s4QKh+PSREj1W2fLP4ENTpZh2cNe
         HuYA==
X-Forwarded-Encrypted: i=1; AKwUvBwmie+xZQe3r9Fqjf3GTsmukAZJEBX2QTOO1eoudZahZS3FBtDQRHgy3/QTojz3jHLlPnj+bbZTE5GgrlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYISYIO/lG0aSpi9DEzfoIJQafnHQ7iLyAjzpX+rubwnVTicEdi/
	u68dHirkCJdhNlQun3hNE25oBfUT1MtspP4STiTxglCxr6JtPX8T5Kb0Q1rpDc4zXhk=
X-Gm-Gg: AYBFou3CU0CJb08wiU2LOWbWzdF6qywWQAeJJl6GelWy49u+eqe6TQUPHqsVYPzSR/U
	q/oEs9DBg/tYZMOWolFXg6GZfdLNZs307SI+5aHWfRfh+IK40g98An4stffEIucQ087rSAtKB8H
	G3fY7Ujfp56XlswQD1AMjnbQiSeDhX9Db6GSXEFQyojTVYqe9y06/gwTpCofLWQ5sTPZ4Y77CJK
	ajZwfXcpdhDYITFrcorH3utY43/JtBjAmVO4b1M3CEeHJOZ9rzMSjxOe1yQdCymjFRAz/qO7FYy
	mlxnVA/MQA9zCe7NWi6cg6V6snCXVXcbj+U4K54WHTenKn3M83bnv2nbbcTxbChdfm8rt+HAJpJ
	0aMB1k0X1iyz3D8dORM10nQmRTzB8SAbnPLi4Y9bGKBdF8NXen5F2PCBd3pPdU6xx7iolI1sjMn
	q26qQ3LZBsjM9scl9cITMOSTtlnB9SgGv58I3tiB1zbaI0pwSIDzLXQe5hza4xTJBUipkp6aAY9
	9tCDy/Cykre
X-Received: by 2002:a17:907:940b:b0:c2a:ef15:2be0 with SMTP id a640c23a62f3a-c31a9ffee01mr693409466b.24.1791708991035;
        Sun, 11 Oct 2026 01:56:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.165.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm334413466b.80.2026.10.11.01.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 01:56:30 -0700 (PDT)
Message-ID: <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
Date: Sun, 11 Oct 2026 09:56:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2026 17:01, Hangxiang Ma wrote:
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);

So I'd prefer to have a discussion about if we can move all of the 
updates to one method.

i.e. why should any of the updates happen before csid ?

Sure vfe 1080's documentation makes some sort of explicit statement 
about an update that has been implied for some time.

My question is why not gate all of the updates this way and make this 
not a flag but a global behaviour ?

---
bod
