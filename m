Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED213CF82
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253899; cv=none; b=l6dkh5jIO98ZSxN7xJmjALEP8kVQRFW7gNcPjPsse6VM82Ag4UDct+LOn240BLIofiHSosQCOCbrNw6FxaUm9ACcIglc8nMgSXKP54oqlUjEi3Yz4E05KZkmULT4vDNM5PodYE39gpVj6ppjTdQEprUQSFUFN+DewGpjfcX4nTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253899; c=relaxed/simple;
	bh=CXg3uuO1BkAGlTroqegWEX3WGAUUDOIvG1EneW94wiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMzzrZzyL1pEnXjVvjapgx3Iw8MLZatW0gMZioGPl2DHNuQbI1Td+SxYBGPqJLij+dYPSTopEWArlSk72HL3AxMF4+aFBVfG+GTv65mENqLZSB+kOuFkw7ztw+M3xmnNKNG28SaYuTzxjM7IQmsk0l5Fbl8735Y7DNCH/Lh9/Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVCAWw+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwMaVTR6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVCAWw+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwMaVTR6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN7E83925860
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 02:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fjs+GNqcv3sJDficPbMQez+LEUHLUpWw5RlxFrCKcqA=; b=CVCAWw+AyTsKgWXq
	CVaauYtPO7l1TE6gSfRVI6dhxqbXQ2yF7IRc3+yGX1py/yiuIf4fONJF3Knv7BNO
	/Ty46zJ9qkMzHAK8lslBsU6m97P0H3+DAIBLB/JEQLRspKlBTM84NWVkmYx83e7s
	4A0nUcXcg0UyUKp+IWblxyo2H0Ur+hTHgzCFqIKlVR86DHWqTrSDHA0IYm+ALHCi
	xEirXP/xTFPiiE2FOLxbFPCsuBbM4KRPZTMMymD3Dk4TvlLeuCLVWLEto4jo7tno
	bocvAniXWRlnrvKu31plOWutVA257DoVsh0f95eDfsGHuVtmiYA6VK0i9fKnCQwq
	oOPx5A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u43c51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:31:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso3157055eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 19:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791253896; x=1791858696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fjs+GNqcv3sJDficPbMQez+LEUHLUpWw5RlxFrCKcqA=;
        b=UwMaVTR6i89koyTAm/qUutbCecuWae3UlRUlNcMBgUYL6qgO/z4RyVWWzcp+xLG8pi
         s3szD/jVTsIb0KJz7v1yH/0ThnA+GUt6c3V5QFs4uyiO58FfRfZM9npkor4tnLxyKw3t
         5L6VG6X5to49MNdMc3jcPwLzivvLPKLDJKuiYDlhNo8isw9GnvrS9o6suW7l70SVrrdG
         bym4s3VpwJkSC2VO87kulg76APHIfC7xvDzE2Stag2EKPNAAn8BfcXIHJ9RnCv/0VBQD
         9akNzJdL/uqw04XGx5vlsGXAg2Iwwi/PIfGrVz2PbvVRMq2GeHpEvWuQor0I7fIH/Son
         auNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253896; x=1791858696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjs+GNqcv3sJDficPbMQez+LEUHLUpWw5RlxFrCKcqA=;
        b=UYvUm8MVY1bLK3SMXphpTN8dd1QyN0OU6SK7J/x5XvlZmRMF2lq6nxtTSCQdwfEOsI
         qjmpIUgt86UjRG7mlwQEJzzQed2ZhhteSOnYe8ftlv87HQeD3sNs2RAYBGi5HBax7e/A
         wXuN533z+LlNEzIjU62m31gPhNeyKIc/yP7tkjHAyKcZxxCc42WbGNoy9p3DYTuRi3kP
         xVfBglx6G1X7m50Llq8uAhZB7uE/fRLHWKYk2gKrU27lEe+ScggYn6X2WpC7E29Prq7A
         qERvzuHPZX86wMsaFV2wVPR8TepAU6R/arkRdtYf/V61fcOiCpdMc0njgKslieGpMW/x
         vxjg==
X-Forwarded-Encrypted: i=1; AKwUvByXUxOvLiVv82oG0ROrBsMZI/GeqAJL0eZ6ncCLPdagWCr1AKoyHGbQyFS7UjpN7W5KQr95K003f9IidA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbvOerBVVjhOKggx09pe0qpoNUiWDHHrukjW/hQay/y6BClxzO
	eceHHBd9AmK0xQjpGTiJArVCUfgm+CenTShDQJAfEUctPcY2KIbjFYzHoJG3lPadZVHCDduIFqk
	ymTR5MnZcUTyv4nWhdZQZ4EdLuSvHxGyOt5StL1m+tPRRur6g5YqlYPPiR7M2ogW1VG0=
X-Gm-Gg: AYBFou01ErV1OeK2BHihZFHDNAWW2HNvroderWQMb0xr5TanH0JFK1mPrWG6L+cm9Er
	ZNrje1ZLIbm9oGbtFwWhbn5hrE4FCzgP4Z30DN84mWOAzI9bRTjch6VfI087J5ND4SNwskUHQ4M
	lXoIB0UcVdlcPLzBOXEuQYmA2zUpxoCUHzuafGhPD1wjQ2SdUAogSUTCmrl+eVXFcUGfvo61s9W
	8BYaIaYDOqfDTJUmhsGoHrArBGsUT+Fcms2Cc8zZynCGyeA5ad5w2ptHDRP0P36tVHvuvNB2y0r
	+gILVVuQzMhqk35u2v6lJHCmcf/VDxwQvXdd4rFChldqpW5ABX4boli0IgQt0bbk2RW8wc2NNLT
	XVCEoqlk2kIen0CiR6LWnPaKUKCnP0mNI5/aZojI4jkgYR/BwVDVt8g1SpIh5QScKu0aXZ7Cf2A
	TW/0PIbjeJ2Vns7KdaGjA=
X-Received: by 2002:a05:693c:4144:10b0:33e:aa3d:ebe9 with SMTP id 5a478bee46e88-35145183c08mr1845861eec.12.1791253895746;
        Mon, 05 Oct 2026 19:31:35 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:33e:aa3d:ebe9 with SMTP id 5a478bee46e88-35145183c08mr1845830eec.12.1791253895124;
        Mon, 05 Oct 2026 19:31:35 -0700 (PDT)
Received: from [10.79.117.82] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b16846sm5026968eec.28.2026.10.05.19.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:31:34 -0700 (PDT)
Message-ID: <1dc1d165-cfc9-43c1-9764-55005a6fd1de@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 08:01:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CeL-R518zlxTO_gGaftGiznd-HFYTRh7
X-Proofpoint-GUID: CeL-R518zlxTO_gGaftGiznd-HFYTRh7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwOSBTYWx0ZWRfX3m4JJTvmd5Gy
 y3gqeH4QVQzchs6n0qj0bG9R+gGbk3/eruuI7Fa61GTTcziQo39zBtUO1iGpTjPvHUXU2EgA/fT
 RX7QoaEjJajg5S+w/hBsyTn+NNc91Xc=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac45d89 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gpu_kyyjuvhznk9Z_CEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwOSBTYWx0ZWRfXwcaRVliJwYFB
 XgeroSTtTSn9IPs1BKp8SNYtJgrgYrFD0VChcb812lMy6oqIJ/X402PgaL+azZJl6D6XGECRzns
 6kpk2JK8+0rXL7m11n/7+An2L+UNVmK7pUyslYxEvaLlamvmSvmuYskWckI1diwpwB9F5lKmgWd
 /OaWoxWVdPSz7y/NPZhi99QwKydFayiX0npneBQO34NV2336tlMfE8STaGMvCxQdL1b4jju44Xi
 LrP+R1S5Ce6lsoOKoB1IgjtVMhhKeg4bPAiXJJzIo3Z0iWff6EyvsH/fCqd3d2fsP3OwHO0rafR
 WaFy4HDQBjFP3tJhkgCovZ3S+NWbLMJnGkFOp0xsHwFS9ynLQSwF/R3cweoyky6zukcf4Ozudqw
 xOR6Ghew4grz4Fi96B9uX3X0sMPTmtVdnI7VMgwece7F72fHQPq8OfdP8sN53klKHDFEdMYiEli
 ctt1Fo5zFIlI6teAqNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060009


On 9/29/2026 3:18 PM, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
> series (bindings, GCC, RPMh clocks and power domains, interconnect,
> pinctrl, geni-se) has been applied and is in linux-next, so v7 carries
> only the SoC and IDP board devicetree, plus a small geni-se binding
> update that lets the QUP wrapper use one address/size cell on 32-bit
> SoCs.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v7:
> - Addressed v6 review feedback:
>    - New patch: allow 1 or 2 #address-cells/#size-cells in the geni-se
>      QUP wrapper binding.
>    - Switched the QUP wrapper to one address/size cell with an empty
>      ranges, instead of the explicit 32-bit window.
> - Link to v6: https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/
>
> Changes in v6:
> - Rebased on next-20260928. The rest of the series has been applied,
>    so only the devicetree patch remains.
> - Addressed v5 review feedback:
>    - Added the full qcom,pdc-ranges map (22 ranges instead of 3), so
>      that all PDC-routed wakeup GPIOs can wake the system.
>    - Added wakeup-parent = <&pdc> to the TLMM node.
>    - Replaced the explicit soc ranges with an empty ranges and named the
>      node soc, matching the other 32-bit Qualcomm SoCs.
>    - Widened the QUP wrapper ranges to cover the whole 32-bit address
>      space instead of a 16 MiB window.
> - Link to v5: https://lore.kernel.org/all/20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com/
>
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>    (added in v4), so like the other Qualcomm GCC drivers it must select
>    QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>    (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
>    -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/
>
> Changes in v4:
> - Addressed v3 review feedback:
>    - Registered the interconnect NoC provider from an explicit
>      core_initcall() instead of module_platform_driver(), matching the
>      established qcom interconnect driver convention.
>    - Replaced the NA mux-slot placeholder with _ across the pinctrl
>      PINGROUP table, matching the upstream qcom pinctrl convention.
>    - Added minItems: 1 to the interconnect binding clocks property so a
>      single clock is valid (system-noc), and aligned the binding
>      examples with the sdx75 labelled-node style.
>    - Added GDSC power-domain support to the Kuno GCC: the binding now
>      defines GDSC macros and the driver registers the EMAC0, PCIe and
>      USB20 GDSCs, so #power-domain-cells has real backing providers.
>    - Split the cpu-idle-states phandle list so each phandle is on its
>      own line.
>    - Collected Acked-by / Reviewed-by tags from v3.
> - Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/
>
> Changes in v3:
> - Addressed v2 review feedback:
>    - Reworked the interconnect binding clocks: dropped clock-names and
>      replaced the flexible min/maxItems list with fixed per-compatible
>      clocks (aggre-noc: 2, system-noc: 1), required where present and
>      disallowed otherwise, matching the sdx75/glymur shape.
>    - Made #power-domain-cells required on the Kuno GCC binding and
>      declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
>      is a power-domain provider (following qcom,sdx75-gcc); the driver's
>      GDSC support will follow separately.
>    - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
>      a distinct qdss_cti_trig1_mire pin function (and allowed it in the
>      TLMM binding enum), as the duplicate funcsel-2/3 entry left
>      funcsel-3 unreachable.
>    - Collected Acked-by / Reviewed-by tags from v2.
> - Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/
>
> Changes in v2:
> - Addressed v1 review feedback:
>    - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
>    - Reworded dt-bindings commit messages to the "Document X for the
>      Qualcomm Kuno SoC" one-liner form.
>    - Canonicalized copyright headers on interconnect binding / driver /
>      NoC ID header to the single-line Qualcomm Technologies form.
>    - Dropped unused <linux/mod_devicetable.h> from the interconnect
>      driver.
>    - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
>      driver.
>    - Extended interconnect binding to optionally allow up to four QoS AHB
>      clocks (matches sdx75/glymur shape).
>    - Cleaned up brace/space style in gcc-kuno.c to match peer clock
>      drivers.
>    - Reworked initial DTS: moved idle-states / domain-idle-states inside
>      cpus{}, wrapped fixed clocks in a clocks{} container with peer node
>      names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
>      stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
>      idiom; the YAML example uses a named placeholder), dropped the
>      RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
>      no corner votes / no pm_runtime, so the reference was inert), and
>      added a bootloader hand-off comment on the memory node.
>    - Collected Acked-by / Reviewed-by tags from v1.
> - Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/
>
> ---
> Hardeep Sharma (2):
>        dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and size cells
>        ARM: dts: qcom: Add initial device tree for Kuno SoC
>
>   .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   4 +-
>   arch/arm/boot/dts/qcom/Makefile                    |   1 +
>   arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |  25 ++
>   arch/arm/boot/dts/qcom/qcom-kuno.dtsi              | 444 +++++++++++++++++++++
>   4 files changed, 472 insertions(+), 2 deletions(-)
> ---
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> change-id: 20260809-kuno-soc-support-1dab826de0bf
>
> Best regards,
> --
> Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Hello All,

Hope you are doing well.

Could you please take a look at the following patch?

[PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and 
size cells

https://lore.kernel.org/all/20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com/

The DTS patch is ready to be picked up and applied. However, it depends 
on the DT-binding patch, which still requires review before the DTS 
change can be picked.

Your review of the DT-binding patch would be greatly appreciated to help 
move the series forward.

Best Wishes
Hardeep Sharma

