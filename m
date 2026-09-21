Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00924908D8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993083; cv=none; b=AuPlfIiWQRwI14dNUG/POp4F+pFH0gLmtktlZ7LZJvO57cOohI9m4b9vk6a5s/E/GlDWcIz3EKRkAi0liAg5XJ2RQ9EDDq7PAJ96Zz5xEQSmQeVzcixZMGujf0+0aXXMXdtM+bEVRU+rNwY9uy9l1EGtr9koCQaFhkN5JMTRaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993083; c=relaxed/simple;
	bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNXd1raRO8AdzbtMRCh7beU3NiKB00yidwEv4H1UPhr5bOvnWjAedYEJFvOr/uCSNhxIU2tIukS4S4NeDS52ql2n+1t7ONs1w52cq/0ul/S+8PLFUigv5t4ZKHieRvG8R+WlU6jstUNxpZflf1CkTS6W0t8s55s82Lp9kW97P4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZTrJO0+; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZTrJO0+"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so361574066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993080; x=1790597880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
        b=jZTrJO0+fauueQL9TtT4/Dld7m7bmK/cJxXkmA074KiULrS3+IxFCCDiYYlTfZYmBT
         cinvcICsh00cYtoOtnQemcRz48VN9p2FR0RENoahW2eH/YUpOcTvJrFdkRdF+N5p4tAx
         UiGnRXQtZb/hDRFuVEUWm5PJe7Ovplz1UhV0MDs/x3EKliRd+ocR66FsIeR/mEq08iUp
         YBAXpdlHNagZPHD7NcGjllYzVwMZfGJ3O8rIoP2zOWizj3xNpGAdhh2m4Jr3IXzyxPXf
         jz359vv/07t8ddYVbSAz0sjFhhLSYwymm/ckMlBICvRchhlOuGGu1edgGUj5wxj1NcIR
         cb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993080; x=1790597880;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
        b=J7G1hTyMcCjzx88fHgYw2YQoH9ka4CcMAYQFCEKIpgj4jeSdXr9HUu+/vqa7RumGGk
         HFjeX3/IQlngOcQoYttuJ7JaU12peVOAE6TTr1TA3cSJ9g5oo4txV+xvsbX775o/zLXv
         O0uDZIbUAd1vjFvm6rrlHHRjuVzzxZakTFy6I9lBg+ceNo70aQTMf6S7ArSE/9EU8pmg
         zf6Fju+LQdIlfT3JCQgAUXqHXzp09aaxPd9B/iDMNCa31U61WrFTnL2Es7uz9Kd5/NWU
         ThjWZODO0eT2DtoFoJb3vbKB9GOy2LRfbvAedsZshNSzko5s23g9y8lbRMz0xRU6gD1O
         +EUA==
X-Forwarded-Encrypted: i=1; AKwUvByxEKL0jkg39wVghezd7VkQS4B+eyjrkN4po5T855l4PxqQrC9B7bymHobKfUf3+/iUe48s/qMnelVxC+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nUpuFq9q3hxgQ+5pMNwMT1QrXuLOJ5F7uYdf6Ghzx4ba7eSjAK
	tdotRrRefbBFpg7TB2sNaLsgobIbW1q3vIQ58uuyNmjaX87aGaSfOR+l
X-Gm-Gg: AYBFou06wBNQUMDqHoAW4bwx4eDdIN7qunlijl7/gwZkXTcUGATXjJwYWuVRMehTcyo
	FT/HPLBY9pVITD/e5Bq2EqV/9LJs+Es2he3omIq1dxVf2TCUwO/YO7T3x56xzKszL3UrxycEdz2
	OKVit9fzfHD7tmGh4VuIrIanYnLkptOLdkx+n4aCs4CuJ/OUSKrg57EMYBcIxb5Ea4hSPokYBr0
	UD5VHnUTyX0m5TVV8elddArGHMyqRVMWfxD8uUEOJ21rK+K3JFvIYYOPGydAKiav1XvUMUtYpW8
	7ABqATRUbKBuMAc6LVLLf4Mor+C7Rbs85yxT1y8S2+Ezn+IpcpXz7UA9AtDumDDXxpRbGILnkVt
	3mEgWcmmn5+4AdJNURCiseFZB3g7HVnz/dmRvQpExG6WbVDZH8pAch1NtWsqLXfv4vQ8pNZDysX
	f9lqLCo9AK4mYu3nh/ik/VWTlOs9bRiKbqYPcu33VfiUPdh642+kFfERMcx5snyzLo3jox1EXI+
	ezKn6/70w==
X-Received: by 2002:a17:907:9484:b0:c25:c7a9:7b8a with SMTP id a640c23a62f3a-c2a156d4a6dmr916170866b.12.1789993079677;
        Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm308205866b.63.2026.09.21.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 21 Sep 2026 14:17:51 +0200
Message-ID: <178999307097.27086.2572116331075139440@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <165d1eb4-f5e7-4f54-9f9c-22a210976d71@oss.qualcomm.com>
References: <165d1eb4-f5e7-4f54-9f9c-22a210976d71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Konrad,

On Mon, Sep 21, 2026, Konrad Dybcio wrote:
> No, merging a node without dt-bindings would cause DT validation errors
> (which you can check via make dtbs_check / make CHECK_DTBS=1 qcom/foo.dtb)

Got it. Please drop this patch. It will come back as the last patch of
the EC driver series.

Thanks,
Oleg
