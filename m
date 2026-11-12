Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492657;
	b=G/euIQNnLwLyNy+6Abim+019c9VI7YSTZZgnDovT592SO1FG4c/zbMjBhPCl28Iect2y
	 VCqDKBBvaXxvY7lozd4s+DaNDtx3l62xZCr+SsRi7cm7Rr2uHmTDgm4NEjDAh20f6eSv+
	 jn9T6H+nyzle5X1iV6nhQ3OezwFisWKC5fMO5QlBp2pyDmB+rXpNlQUeNypdGOWgUQn6z
	 qT1HroEKOBzp0ibQyhE40qH1WO8pTqqN21pJ1FsxOn6BKxCPg61MN2dSfuPKajwSSlHHu
	 Ofc0FAwWiLy+3/Vvwh76BsJdckNSlr6fBLzOb1PB+f1BR1CCgzOocHorR251pS57EJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=;
	b=mkrARgutjhS2C1ecRv1m4gkbnmZtbBVdyCoNz8KkUBxBTNGO5ndAU30sl2Wl/j35Zv5z
	 cDWwLelRaRIrRvmhS9deh4xjychgVDQck4ELtgsQrsNzuSz3X12U+3zvdTVwp8C/BbzVB
	 lIC3awEQ20r/msC2BGLwvDisvzLuUBwa5QxxuIZOrwT7tcYdXUFdvOIjd+4Kljil2qZwF
	 C9J6akfibRnVY0cPSRYnKhzwjVtRp2cKoQkIuJH1YjIOc323ndEsnHHDPZbDaQqrxNYMJ
	 Gp4espl8hOCsYG2fptmqnWY7tDY3PMwzPOfmIgrSfPP0VrKH0si2PXM/7XnqPdVi41g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q08zPKvt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BETrjSf8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E00606A8B5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E00606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q08zPKvt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BETrjSf8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBRa533893507
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=; b=Q08zPKvtWQ7/BhRg
	dADUp26Zn50BB1nOQk9IQoo7l4jpWASz8V5Zz3+dBG5oVqNrtIeqX1GUINuDREem
	OCqRCueHPPZpXpjnJULVG0rESSrg28b6cdWsuj+3xNNwFxq3owvsPj37SdwE/c5s
	HYglpttYh8ysA7XMocq8xRO6NpO9oeeue3mOllSJ6pyvcU93gfR7vYC5kocLHXnM
	j4gA7Js4khBI6+6dy+93MGe7fkF6dZJGQ7ijM7h8hJXjECW2ZedL7eeJoK4Y7tPv
	swGedbJsOw1Kfnf5dT9wijHJFzmdDVkXC4PO+RkTgyC6Rc9phdyyEIxdUityaQx7
	Juqe9Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1x0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece45cb25bso1314730e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492656; x=1795097456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=;
        b=BETrjSf8pn1j4LdDwf+VTGvbcb6Jau2Ie3sQ1NtOjU1vDA+ugkJ3LYFMQLkeeZ1bSG
         EMFOJj9uBKUYw1mA6f5wIGwhQBEqq7melr/GvzwRDXRAsC/66NbCpFX2hbMf+2W4lIe9
         rpaaIT9bXYHZQ0axqMhzV5tXVe3dVuSdCHgoTMFTwUDT1wRc+2IjpLc4QB33k6QXQNDk
         JlFh6u1fhrH9rj25u9uh7O6s8G9LLXmIzQUvxuTOu4Q6XoRFw4vZSOj8KA/9coItnDwM
         SlBlxBWgqWdOE/L4yUp8Lov76YmU1F59mSI0sR01JFm5TiQ1Bm7mQ6eM3H10HFfAxZp/
         652w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492656; x=1795097456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=;
        b=oJWFpoHUYhdRS0+2m0a1VxMeOdsFMEkRxUM+jOyAalsNkdw0B19Z4XtzKBAmBW3C4B
         teOiYd+ITlLqjYYQLK0yNNadWktc3faOOwoyThqEjGD/eZACuqjKcFbQoqA+kDUZnnDG
         1ypJzvQzAJuY77U8uLz3Nxn/V1ex/u4MvdGrSa24xnqlZZ6BmgsHMd52XqVRbET6BwAa
         7wJ40/0NQb7MNDjd59Yc4SAU+Vmj+eF4f5fvIZ+eH4XOG+5n61bYxarnPjiPx3Hvux0P
         vxXk2KjRUOlHBr3b3lnyKz0lM0L/MIaA+H94HpM5El5Ixkt3hvCTSJz3auhSOvm8+bQc
         HrIQ==
X-Forwarded-Encrypted: i=1; AL+hErF5Voj3V2N2Ftvxh1i0B4bLfltBi/XEibjpE7u7Cv42rqdsdJHeDWXGyGXBuV5H6jBfcGx5iGM0wW4mELE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NiHUi3k80SorCzvCDRmqQ8BKSTsopQT3PHLuySozIwpAQ4brI
	khVog7LhYVeMPfWeZDJNyRyruRE0iQWsoegjbL+UqicAYdX36AHFxhxqQT7dYqhqnWOnbsWtIj0
	hsJ+4P45BZCRsp3z9nLYWsE+s3vvsN+0P6O/1E1FOpDmZmdsBNH0zLKe7Fgs8BfIuaDI=
X-Gm-Gg: AYBFou2C574X14NOtYFlnREHWIVgzWvdZRKv7MLu4z8mYKbXw9ggZ131DnTKxBbxm9n
	ie1YVa4Z5tp+7+3paRjnp2cipB1ipeoVygh0fBsc0FXxL1GVnWq/yr/xr6GBSuw+cPX/oJBmCUg
	zKYB0DPbrWMP6845nK9B+lQu6rexFcSD+IuCh/uzaYCMhUEN3sMlYTiiBxs5MK+JTAxJ+Vtd57U
	jfRAYmgYX2cGmpyatcSj9H9UnupyRicOY304Jcvh1vUij+w7eJ+rzOwlkSGkPpyEz6fZdZalgv5
	R0OfNjFbWhG2MCG85ZSO8HVVuwW4VslrCTP5VE/sWCTcCZSk5Znfctn2GWH6pAEsKsuiRu3zpwO
	9TtiuIhX8PnLFUMPlHhkmdCw7YVU4x57WZnPY3Xh2ZAED9BI7Q8r9pXAm7DqJ58tQ9aVxNHMfSW
	pPoCr3S5tCumLg9WfOZV1UVf3pYCz+aNOWBlvsj18Ch5LUy9PPlnp0n30yR/TF4Zg=
X-Received: by 2002:a05:6122:3286:b0:5c9:a60d:3276 with SMTP id 71dfb90a1353d-5ee1c3fe5eamr2294766e0c.10.1794492655766;
        Thu, 12 Nov 2026 06:10:55 -0800 (PST)
X-Received: by 2002:a05:6122:3286:b0:5c9:a60d:3276 with SMTP id 71dfb90a1353d-5ee1c3fe5eamr2294739e0c.10.1794492655342;
        Thu, 12 Nov 2026 06:10:55 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:10:44 +0100
Subject: [PATCH v11 4/4] arm: multi_v7_defconfig: update the Qualcomm
 Crypto Engine entry
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qce-fix-self-tests-v11-4-b86a65ee7107@oss.qualcomm.com>
References: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FctauFHZADEzXXldL+PPLca+nRIKDHu5xhFRwimXZqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjlCVirX+YzppCZQDD7Q8AvfImymH8ZnTh2S
 ZJ/vwk3hAyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5QAKCRAFnS7L/zaE
 w0iSD/9/2ZqsJSw3c5O4JMZk8f3SxL8A0Hln0Zj2cOCj4wFI8HOgqaviwirUZRlWo8qjhjP/9/B
 MzDmcswmU681m7LO9AG7i5ll/306S+G71IBN+owa1tfaCtj1z4nRQ1rTHj/oxEZq5O9s7udaKgk
 sYIumk0AVBanFjk3sdkpPJ2CDV4C0Pub6DSGzIzbnxLy501Q0a9JcuUmaT77OlH6yhi/UvI9hG6
 dSEPhyQPBN8JRRa6v32M/AKxYMQl6WDa4jCyARk8AHO/3qeEBPVwbEO50LI3t91WFtx0jp9ZcCB
 t6wVvD16WX5FhO69Je/2N7MhRI02s+oi2V2DLZLWcp1L+wmeEESgmcKWZzgxllNG9tG6jvnsW2t
 u4bN/1iYJm1ny1hoiGEIo1VxVZqWhUj7aJ0RIhaTrbCQzhNUjApD3QWKPviPx8OfNJAYehNEyu5
 vf8F2/Q38YbRqWEFA1NH3TavFkMssQkvSHYMYfCI1TF6FCiqyMNE6yUafhChQo132zWZR6Kj0xq
 P5R6aXe4GBBLLPRwRrl5UGKPcesqKrmdUnJ9eLFZ2mI+S/UAUfvmqlwSmTH789OUX8L/B9o6UFV
 PUoc40n6t15RSZrQFIoMcen4tz88G908HtwaJB9csvqa/vY4UwwuhQ+2Ob7thoSesAY93GLbqge
 EJ+ziK/bFuvvLTw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: OhmY_LS4u_-5HFUv7neXRNVp1dRz3j7l
X-Proofpoint-GUID: OhmY_LS4u_-5HFUv7neXRNVp1dRz3j7l
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5c8f0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX7YsUizdCOClZ
 oqLBeKCQXbihW6nnQ++4fvZ1ILWVGvivy3rubKF9qAjK3vpLCUXw2YG5x0ZcHFKG8WPiTJVQmRP
 olUv5JnbwyJi5xoUE0AHoG3puEEwYd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX+c+Qekj1s7kT
 cBrCskd21vEB2zLbVLUY1PE0zT96hwHxe4PosCm8r1pWFqz/GyiB/yIK90wb3aUZnI367cAZvU5
 HP7Gwc/nkG6yjH8BzLVNZz0eVIpMZM5Y1AZ9AAIQ8H+6skMkIqIEdrsXks8GitJj86dvKxbg14e
 zO/WqFx44vO4+HvYP3Y4hJOjh8bVZvZl0E+O+C8T3w3wZ0Vwqum5OoDKQ4szUAL4s5HHlSzBro4
 ThdORQJK1xMxVtcxo1IKRriGiWjJu5TMZZl9uEtj+KLkCIbkD/HUpbLzUcwaloP1JlXv/8An367
 YZO4J4GXh5oQjR7J0jS8y4k+33SP5McJ34GC12nXBQ1CKt8Sa5hdY3ntw/zfRlnJ1FvWRbmCAxo
 BfitjKExu5JTdjFPA2T394B9rhJUMDJXlghgXGFnZ8lazFkBShEahVoCbSJBDO/Kwt7bjqznAqy
 w80ua+ZxOSg24BUnjzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120056

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm v7 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index fee64572027ece8a07524db7bcef5a4ccda71339..40b0d2a8ed1eff5404dd6e821433044475043880 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1134,6 +1134,7 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
@@ -1305,7 +1306,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3

