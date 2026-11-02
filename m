Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632292;
	b=HU018vTp8j8DU3aUgR7KXSdgJy9txtU6UI1L6utZKLGSJHoZ4zpgcwRUm8dAtYjQAkxu
	 5OqPdUx3XvK8qmLZRSFIRKM1O6mlm5V6lE3o9KHdIXOHLSiRu/phxztRwEeb0OFlmyM6N
	 8286fKFBvlCHf/YKuDdn+cQb5D3BGiga36pq1fpzz11YrRgjrAo+gyEHv3N6D4oH57qFO
	 z0g4DapzsXBA9uETY2RuxOsg/+fHLVasZgrTtb5wqalpxgf14V19VUQJLMwrkrSKtuLCh
	 pW7Ac2R4i2GBqbuTDtENB01sziZPpGnhYjRVC6PxoqsYZGM6zz8ghDqtE6kAFF21fbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
	b=T0At1/gVtZBfYmhwvNSQZzXvk/Aa36W93498BLHU936jEMDTWSpNPjrP4rHhbbygugnS
	 i8+rVZgmop+Uz+WeUm50amtCZhFKD0AZ+/A13P1TfAROjAJp1pbbbzSQwQQHG5tzJA3SK
	 dOQhX9ljngipT7L/5lBXQ7MnrGYlCPin+IUKxxF89xTQMWoGGqi9EzW9p+Ldpuec2yxGj
	 erEReuvXzt2pHaabZTWi0QwR5nTzFLXjjXP655crNUBSp03iYYTZhIrPki563cbCc8iQa
	 g40N+Qujo6VTZewt6lAx6vi9mLTSKfUg7L/BfxuMYBX5zmqFpb3vhRGq5QhkQ39Ohew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TBfs3lE2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A09NWiOz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE626091545
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE626091545
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TBfs3lE2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A09NWiOz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpWSj477185
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=; b=TBfs3lE2P90N+Km1
	czkS7Ppdxyazmbpd8rBJm8hVRNzXd97F9kKDAAhOf/T3UiaMV2bfSRscnwsCGO90
	qKdjJ8KrGqvR9c4aT3t/9Rcw4ynUDSw8uB7nIj05qgoOuWlij3vE0MOEk9FZRaXL
	/6FL0V6zCj7bUeqpZviAX0TOWrtBGIbcaIr7kf/RIXZQbudaR8JR2N0aX6RUF1BD
	ZTtjiJoX5n55myL1S1XCEWKetJnk3WJQv9q1Zm3Ze9KV2f3T/EKOytfLGdN7zw/J
	nuffWBFwVxGq5uJE448Sqhj6qd/ECF6J1oL5VpVMtRlxT9VE8aohpRcxHdZ6b6l3
	HZkkFQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19qv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:11:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so4298597eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632290; x=1794237090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
        b=A09NWiOzLAm4AndA+KA2rVrCJvIdXKS02rfCvnkuGHDUi2CCYHJ6Apnqoyn+TVmPRD
         B09jUWYtEuU0zEAn3auwt3ED5mY2zZ1BdSTaM1lRMDWGH0b+wWAmXK5C/oP7/sw+UgK0
         VCix8kYLLDc3vrS7OKyUDZrt+rq8eeyjEZje+V0oEUJWgQ1IKru2nNVsv5zjts/lmglV
         diu8C9hJ1/0Ci281Ibtldh2nlpnZuOu+9CMsopB/ie+x0dcCYBDKwg1ujXXpLIlw2rym
         u0ArxFoSh81pJv664aSvmwjrqnCuhQS93W/sYIEyYaqJ/owSiOfsI5GS2jb3FF/t6u4d
         QgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632290; x=1794237090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZiomICv6/OF+OnXrNCXeEhHc5Dr231L7EIS0MH/Itg=;
        b=AEzAQ4shVb3lQtzFQo3LImaqI3UWvtJxHQfQOoIIcnAHBqkngqboqFdV8AfyHCxjnW
         OQWvxItDwH6eyYWYxN7dgiNoDedXJCWzusjtQxYHMOcOWR1oaw0dMc2rlbejnYlyQlIQ
         ChyvgYRrJQrzK3H6kvb6pcUUeh45T0kHDKWpe/3mEwpjwOAuYXWVliYtF/9B+vjjKGfa
         ihaAGDe4wyzDsQU/RyTaMtA++R7MPxnDUlqSIevRYf+WbMlzEDatb+YH+KxdlZryAfyP
         q2f1xhVECR+EF1tYuua6EySHzvuq+0bKTZhlYvy8T0gEYHA07tnVj1A94Ee1h4geuf/L
         pifQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkmp0iZQGOEXLIgdHfzWZ37bBZ/UGu/De032A7bH6s1E/A94zTCb6rXbaVPCTgNP2FFfD3Xz5RVjH1X74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SCteuszyYkGGaSV8i95sj5nzagfTkLTagrMjQRmeZAmOnCPmv
	IJBPXuJCXHgZ5EwYrjt7w/i/uOf0u0jIxXs2vYeoi0oDI9WVSW8BDuY56xJkjDVzpUReV3pM4OX
	O2F11Q0MfxDeY7gK80YISLHEnThf6ugbVZb+dTvyOKHoY8lwnbcA2kKxLCT+wVu8SNh1t3UJAsR
	U=
X-Gm-Gg: AYBFou3b4RLl3qhIu8YUUDKteG/jlmvWsimuI8PsQuan2cGpmpCzSPU93bwELzQEQJ2
	Gj8fLMk9dMCSxXSu5DxbagDZvDX3E1K4Q/nlXEmoNz7UA+7RAcFxoMVMj5XEG/bWchh2HMw9aNa
	DK+fZvMuu/nYJZ/lXdIA2+eNpZFvQ1Rt1NDBULAX/w6JRifccw2VxAY0ocs5sse8eMiynJ6BfZZ
	mUkUQ+LEDdr5+Idn3L36sYgPJtSLZ/pd0tf+q7wV59y29xUiTKOy/8hJkSj1MCr3Gvt39D9iUpB
	bBrCxrsiW3IwhjFsSCNhtg8xcfMiYORRlmm1ABuTCeTPSvtH25KiYFarlVGeymT2+VbAVshteVT
	uobush0lUzNVrDjU3ksDZ9sImiXaqLPItFzTmIoh/+HtSPwaaE+mP3zyZe/m8TotvwunMAQ==
X-Received: by 2002:a05:693c:87cd:20b0:366:fbdb:2070 with SMTP id 5a478bee46e88-36a424de53amr17249115eec.34.1793632289700;
        Mon, 02 Nov 2026 07:11:29 -0800 (PST)
X-Received: by 2002:a05:693c:87cd:20b0:366:fbdb:2070 with SMTP id 5a478bee46e88-36a424de53amr17249058eec.34.1793632289035;
        Mon, 02 Nov 2026 07:11:29 -0800 (PST)
Received: from [192.168.1.7] ([106.222.229.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm38816044eec.21.2026.11.02.07.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:11:28 -0800 (PST)
Message-ID: <a11e2565-3885-4476-b399-2f62c390b483@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 20:41:23 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
To: =?UTF-8?Q?Lukas_M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ucZ9cXy85GIyRJcGmOwjqOfpP8saD62I
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8a822 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=+m4bPbj4bahp+20XAXQLFw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpWDcApjDx3U_qUmb_gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ucZ9cXy85GIyRJcGmOwjqOfpP8saD62I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXy+WIaDwU5E2p
 /Qpt5wkkZ5ENRFEvBRJRQul5ZmXDQlHm7c4+wFI6d3SXFOAhE3+03E3F78d8kteP3eV/vFcxFz0
 Epd8asjTqxvaMZFyAtMjQbh/6GLS6AIPARt2hBLOhrN3M3M/IYugPe8wUy6oO5I95Y1KE9F6iVQ
 grKi/x61T3Y6WfXq+8KEaXMxAe66lYpDys1dvFWrtpGOkYsod/Vl/fvuMtOHK8cxYsGZuWUzT72
 QAmFz625I0nuG5wJnGSW93gQn2xaCMe2wqjwsxnfE9lFgASJ3cjRpRxyeIQcHZBRWP1V5HWNH0m
 JBSEbrZAfFxahEr2cO2zYC5qP5r7Ssd4ctlpONTc3Nx1JG/HEJ0OwiHXuVfyrs3TTE0JNYurXTx
 sf7ywiOknkFxdQB7rpEQLONDSIpGzJhAZP9+pG4bZnz4w/h1oyVUXRxZljezU+SHCwa8B9EArym
 evj3iAF30SDPzTH4ERQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX5zNaWjW2ufAl
 0JmWf1g61RmSHVWKP3psV0nE4z7qjO/wMRwXog0jQRZDmvhNBqT53nwCuKQSUAxUViUt5DP2zOV
 VVVkbdpqyHvOQTXBI5cToGcMu1V+YU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060



On 11/2/2026 7:58 PM, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
> ---
> This depends on the Mahua GPU support series, specifically
> "drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
> Support GPU and GMU", which are not merged yet:
> https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
> 
>  .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 255857cda9b..189dc3fe542 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -693,15 +693,6 @@ vreg_l4h_e0_1p2: ldo4 {
>  	};
>  };
>  
> -/* GPU/GMU not fully functional yet on this platform. */
> -&gmu {
> -	status = "disabled";
> -};
> -
> -&gpu {
> -	status = "disabled";
> -};
> -
>  &i2c0 {
>  	clock-frequency = <400000>;
>  

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

