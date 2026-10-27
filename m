Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793085284;
	b=M/v6edm2UENViXOcvdI6oX0zQ/zYZLEvVNbsOMfhu5aVIReyND2rSeVEZhDIuW2ZTKJM
	 dyJNmygy1CL7uPBc8TeMOBz+34udtDeNh/Fmw+lsVoIDr8I+Ahk4kr7bxOjewVqjtjjCl
	 G/vfuJtX0B5isBndV3UmB3BHrc0nrio0zsbRUWvaVPAwaDSYZ7DFrWHwTkiulAlWZY72a
	 SVloaJthTER+U67UeireAkuvqoLr33GBa5yukEjhaVrpSqb1+TKUKxXrUfS7SSFu1AROh
	 TgoqCa2t+o100J0WKLQ+3Z8cv58lTY6lHpqW03CipTjmraohI6OcKixD4Mg0mafGZXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085284;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b1V2VzFhlnlIupXjxg0vSEazQECTmGActe0YWWB9C5Y=;
	b=3cTI/vV7ef5r8hZon6fOQGuokkizOfBKuM9iREiSOqltcDVKp4LuO92GFxtt3mzT25Zi
	 P3SFiMKS/46w92FLDElgZJ4rYSRcNCV/xhsxVxi/Lei5gDjKFFNIh/nyNwyjTYaZh11ix
	 /b8Uj+Mjc1PutQFP5Ts2QVkTdp2qkhs2LMgJ+qUSChD8laTiLFmh3+W60eUC305rvzF0z
	 yAo0UxacdqlbM8rUhqZLoqiLFRuZghWbucuZ0xc6cl4FXmmbBd2sZ/NMd9K9xre4mZIQ5
	 fka4Kd39dftLZI3OIkNiDRtyig0Ej2zSl9Cb3LnMuCVjuk5Kjdjng5zJ0TVK8x2n9wQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OzUw+ba2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F7B606A32C;
	Tue, 27 Oct 2026 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OzUw+ba2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793085284;
	b=jsKnL+b96c8M0k/WLa7cBwZM6/X1dQdJQeMRiE0DDWXFDRGlbniEhbFzmcjrSTjNxt6a
	 odZCknnhPasLRtBM2oaAzpyszME2UTPwu3tt4D7LxEPEF4tySHzyfccCNrUoCGfxEoRMf
	 wjKbjJwl+2VF2ywpKuTdHj0el1e4+92m2GyOht2Dxx82H6KOQqjEH8L1PuAyQ/G5e8eH3
	 Bq7VOGPclsyTYqlI8cxzpWme3BWm1ZF9OOnNLZUPFJA6cO4EzzUP3EuVAJAqrfgo+eO93
	 6s0qtIXd8qztsmLcY0cvXDeCobEGhMS2foy7QPTfH3HHs8iwTJbl/dQgC4CIPagI/mw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793085284;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b1V2VzFhlnlIupXjxg0vSEazQECTmGActe0YWWB9C5Y=;
	b=E6w1GQ9Ge1EPIhSms/1OjP+P90E0bNBg3yma5kV/7DyQfMS0Eegd+FE8SkXAjN6oUNar
	 6w5Zka8NGXDPB3+1qMLYV/18SHGqJZ0w29zyLMU9EJqfZZZYe6i2Omx4HXgSe90QAgc76
	 5tGvk8U1O6RQiUdwmwc/xUmqmpxBZjBPwKeBo4N3UsRBrLUgZFGCGqlps50ulqwZnwxzg
	 Y8ihC63E1ck+3Cq4hQLZtAjTqmc8qGv9eYrBXhqyD7iF51RfMexYPhx9r9l8+kp1c9VOx
	 88b8UKzzIs3YkWvzsOjFN+X8EmxJqDlYcg7AIKLYDKG0DS1N2R/gfzn8c239187z86A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A53DD1F031E2;
	Tue, 27 Oct 2026 07:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793085284;
	bh=b1V2VzFhlnlIupXjxg0vSEazQECTmGActe0YWWB9C5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OzUw+ba2kPWkFyNrijcHGIo3Bx971oRO/rsBx7evmF4gXeFzPTV5SNi4tAq4xwn2i
	 zW45idQbo0XQvNRbAyvWm8Mcu68v5FuCmYxJdRM6eL+P7iX8tEcOmmMg0BC1P+0Hi5
	 aukgNhk3/DgUT3EyDHpSRBS/175Djzl618OwjE4Q9trT+2ZcxmH7DgiPXFfdVo39vV
	 C8hEOrcivd8ze7DFCPfwhRCfGq/pI0N/wkNMS8R8FkrI8ifXpV0MX+uubCPB7Zxabw
	 xu63nVq8eWdXOQP5Jh/06ROfSUWtyFLqz6/rfcrAHgoPwN86APvUnAgoivJfWBvPMk
	 c+mnNrcxQDFIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3D7FC4501C;
	Tue, 27 Oct 2026 07:14:42 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Tue, 27 Oct 2026 12:44:38 +0530
Subject: [PATCH v4 5/5] drm/msm/a6xx: Protect the 0x1c800-0x1e7ff GMU range
 on A620 and A650
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
Message-Id: <20261027-adreno-a620-v4-5-b0095e028c76@brar.si>
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
In-Reply-To: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793085280; l=1823;
 i=patches@brar.si; h=from:subject:message-id;
 bh=uJTDKKOJDAvrd0WSzrpyyryyzrwcJ4u+PPWaRGHdnNY=;
 b=RcTOxjE8hhv0TGlBtQlkofh7TIPAqZnkl+CNmTWxi5zzD41biNM8KTI3r5WnPAN4CLoM6BcXM
 O2YShEc11EMAt9Rp7hIYhKRsIiTFZuI8E5/8GkKmDBH1DLPHiE8fdS5
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

No protect entry covers the range from 0x1c800 to 0x1e7ff: the entry
at 0x1a800 ends at 0x1c7ff and the next one starts at 0x1f400. The range
holds GMU registers, among them GMU_NMI_CONTROL_STATUS (0x1cbf0),
GMU_BOOT_SLUMBER_OPTION (0x1cbf8), the GX and MX vote indexes (0x1cbf9,
0x1cbfa), the DCVS option, setting and return registers (0x1cbfc to
0x1cbff) and GMU_CORE_FW_VERSION (0x1d3f8), see a6xx_gmu.xml.

Add the range as no read/write to the A650 protect list, which A620 and
A650 share, so that these registers are reserved as well. This follows
Konrad Dybcio's suggestion; the downstream kgsl protect table of the
OnePlus Nord (a620_protected_regs) has no entry for this range, so there
is no downstream reference for it.

The list is also used by A621, A623, A702 and A704, which I could not
test. Tested on A620 only (OnePlus Nord, a 7.3 based tree): a Vulkan
workload ran across GPU frequency changes without protect, fault or GMU
errors. A write into the range being rejected was not tested.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 6cdc3f5a2583..c93de04bb187 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -576,6 +576,7 @@ static const u32 a650_protect_regs[] = {
 	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
 	A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
 	A6XX_PROTECT_NORDWR(0x1a800, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1c800, 0x1fff),
 	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
 	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
 	A6XX_PROTECT_NORDWR(0x1f887, 0x001b),

-- 
2.56.0


