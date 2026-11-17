Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887077;
	b=iK+u7p7q9KcfsdCAHi+YxoMDTkeLyDnO5ejTXbR061E9Fz1pm7cYSDwxl7qZX4yLVmTc
	 UNyFvoxy9/SDlP5jQ3i27N4mcJTAAQ8HcocEUKclUNIovMG0ST064gTtaNwwKauX2AzQ4
	 Ma5h8UNxDccDqFTKbPC4N9EhEQRMkCMnhO43Jyw8p73Map7gw8nGGodo4mUvJs8EJ3INh
	 yxfF9BPO4ogDCxDKt3ID5T2//fTg3qKbmFU4OeV391pzjVR3bUcH9j7YEmh7/VVLFjtEb
	 4aZDtVD+ck/YM0HMbuqagQT4cXGAKT3Tv7yxI8huScmscFgLE3LiTUiqn6WjKDCk9sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FTr2Ir2VveDHvZNQ/ZtxXIYmnzC4Bm1U9lZRzd2tUxc=;
	b=GYldpmtCs6jPSYt083MQH9UPBwNO/fwDwY0L+p0lKgDuJZN0MJk4G1X9QevTnJ46MlbM
	 YfghCW3DMp0bRgQyfQ+C+JBvhfyGoyB5aUcNUtjsBHYqIii49l83gq4M18hSMuP2Fyx+t
	 D2D1CFnf1HhSUrqsVfzfeUDwffLc6GLQ+NsLmIXt12Z9VoFGLZ706kjxpHjFdESjlJcI9
	 5E8cQdUD2Jefqq+CtZIPUr1B6hEkV3szoegveTq4DC261fq02yJQPHldvI/GvuXIcJSUE
	 p30zsHlhHZW7IAsjI4WcWzjhXR3wUQlBhkKgiSS+/dSgFnNaT5fqlktGO3wtkGwa6zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zpye+J1d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7tAESKo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2922606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2922606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zpye+J1d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7tAESKo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aGnw1800692
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTr2Ir2VveDHvZNQ/ZtxXIYmnzC4Bm1U9lZRzd2tUxc=; b=Zpye+J1dDGbqiBFt
	sn4WDsBEVwwAyErMkl4ZOUe2hs9uQorbN8DiZS+A3FLVAlymAJr6diWQ6FtJXvOr
	5zVe6qIyqxTTTz/XO5+rN4U1ZrGt0o0DvDqeKAB02i8qoWSR6Q4/t+j2ta7kkWYH
	2CDgyeR2mvK3madBJsoCCPnx6N5iMxS9AexuxI/UK9H+YRppV61mcIe7mHHk9zFu
	Y/LocpQajLjVeFeRdA8dce0tjKkqxhn7zXU/zKy5RPew6/Yk6PLIhx3qSCF28jW4
	J3VfdM6Zdz1WVS2qCYZT7DUehNRmKFvEqPGICtYhRUnY/ZlDh/dxoIInw2z0pfHv
	B21fmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y2wmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso799033a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794887075; x=1795491875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTr2Ir2VveDHvZNQ/ZtxXIYmnzC4Bm1U9lZRzd2tUxc=;
        b=U7tAESKoKneO2Q0kwazMemh9tT8DW92NdC2EioH6ugHqkWjcUCixLqn6TfQGvI2jH1
         ZZHUWvCx6w/9vVEORf2Es3Qsk0kuRfrTQv3nvRPBFOZn9BjWLIWsrTX9nuuGAo7zBhme
         scnbeykVpYbGONUluIluJvVQg+4wJvzothUP7Vl3GQdjK7O+1UbvvHKft30USbOWFdp1
         LyYX+Ftzn8ohBu3wouvxzc4aBYtiiWawa0UX9W6cVOSjZFir6KKltC/chFsv/abO/4wi
         qkdOggor6AeQMyy86dg8V+Hm5BYzhAZDGrTodkfHSpUzH4VOH0skYgIzy27MADJ9fheB
         arvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887075; x=1795491875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTr2Ir2VveDHvZNQ/ZtxXIYmnzC4Bm1U9lZRzd2tUxc=;
        b=sdLELHtrGjATXcJtQzhpyLpAt19MI7wJn4QVi0CNtgfVUI56DmxpNk7teQa/vz++x0
         HYjn2qOSt3yNMMX9iMfO6zhlVzBV565uOO8eXmQMoC21JYBvgjNsBtXeRktqbQJA9Gjo
         176KbI/5zQH2nX9VKkBqNqS6TDbmAB3xW4joqB2Qq66CIJh8DC40tzz8IIqBzVj7Y1Dm
         5eXDJEsQI+D8rG0HY5YolnwkGqSrQ0p3mvpii6+D3tLaZNIdpgQv26i1KcL7ddbhB9np
         CDvAktI4k9Jge1buaroaZGCzd2yoInQs1z7EWwZSU9iuRbiXFWnMIIdlU1XhIMS1HNG8
         ufXA==
X-Forwarded-Encrypted: i=1; AL+hErFtKN2DftLforA+uHLB5k0IIQ2oSpzySL8eHI4Zs2uTb1uS7AlmCXofz66VBFkQJmGM9tlvtnPki9Tmgp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I5VvyB+CJ07yjRx9nWB58D96jSKJLaGvMjrr8b5eVyBj7TE0Q
	Y0k220IA6CUO3TuYrqS2ub9FCHFtKFSDBN7NVNwTlj7IW9OufFWiv51kRn+dP/Pwd5oIqO1RgIf
	Gshh5Me+izmvUarnuMjOV5b8JVfvwJgtly788HQ3HM2ObG5x80PcQPG7IViQQ5LzJMzw=
X-Gm-Gg: AZFdTZfO6nm9osA3RqsCI2up8a29r0wS1/oFS6Ve1hqr+8jxzD9qKZK0sSpoG5FEICS
	IZ6BwNDoq/s3NRT5Q4fZuk1qD/2Z9/kDxR8C3ZS3imWO1B3TaTSQJ4Ulu5h5REfGhBglaQ+O3YF
	wgGn7WKNnXe/ElMo4y1iaRsh0idCMcxZ8Yzdyx3F8bzdIuBJiw3OUP57qm0HZRoW7cR5yb9Vvn5
	Z4FRiceQhX4K9nd51+rxG3sm4r32Rh3bwQZNjliWgiEBVNGyiq60YVUbRZd1Xrb63m4mgmPiU/C
	wSVSrpFTfSs0MZ4eeldoDwjVDbXkZKpADtl6Po5CdtYAS/JYZlq/9nVejU47Pj80yoSavYbnkTH
	cXBYeDWbOqF9U7mtZai/D3aWuL+DX6Qn8aIWJxilxSiRm+KyWU22ybttojA3JSFUJGuqaTHs/mb
	ntgZIu+1XB0u7/1jD+mJ8/e9rx41BpgjeWbkz4
X-Received: by 2002:a17:90b:4c41:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3b1b089e2dcmr13233273a91.3.1794887075210;
        Mon, 16 Nov 2026 19:44:35 -0800 (PST)
X-Received: by 2002:a17:90b:4c41:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3b1b089e2dcmr13233254a91.3.1794887074764;
        Mon, 16 Nov 2026 19:44:34 -0800 (PST)
Received: from [10.133.33.70] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm1718121a91.17.2026.11.16.19.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:44:34 -0800 (PST)
Message-ID: <b586f418-a8e0-4502-9372-ed15d559305d@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:44:29 +0800
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: fix swapped MDIO clocks and
 resets
To: George Moussalem <george.moussalem@outlook.com>,
        =?UTF-8?Q?Dav=C3=AD=C3=B0_Steinn_Geirsson?= <david@dsg.is>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112155801.610730-1-david@dsg.is>
 <LV2PR19MB7970413DF8BA90E631C5D6CD349D7C2@LV2PR19MB797041.namprd19.prod.outlook.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <LV2PR19MB7970413DF8BA90E631C5D6CD349D7C2@LV2PR19MB797041.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NICDXRPzY4Vy2KafOOw4zIe-BLn-m1sv
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afbcda4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9htlYK_AAAAA:20 a=UqCG9HQmAAAA:8
 a=xG9mJ1_p4bxWt3gOV00A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: NICDXRPzY4Vy2KafOOw4zIe-BLn-m1sv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxNCBTYWx0ZWRfX2vf3dYgy61RT
 ly8UpvBSbE1qLtRKh5mm+aVoE0MDiUNeh5QQTDQdMkm4EkUN7td9wF6TVRCbFrzF0rcOyqUL8Zw
 x/gLfSbj7VBlTnKMa9/t8noVYiptLK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxNCBTYWx0ZWRfX2yoLTi/t9RcU
 e9Cf7MjJpcpUEeo42y/X95G6bzXuhh8BmUgyFewwvO7mfUyjWcYWSkrFs1X//yzkNU6f/VO6xs4
 lzJCbFPAX2I0NnxoVrTMrqGCC6GSRqz/B0d8AciOcRZkausufDpBZ4IOO4B2yFr6OeNNIZ2HGAY
 G/EZ1j+A1yX/Xj6bUy7yQjF2pP5m3cc2QgtRWRYBbLi/lDNutL6N82go69jEWIwr+e+SZrqlT0j
 VEA/vPznrbaqbMqiM6fJD4uZxzis6wBj8P+1g/Pt4Zsmq5L1rsS3Ag0Rc7uN5L6Mi0KXEcCXzsH
 gtnQuXu4cvNbHFBFZVFX9ckRSOClraTj4zW7nic/W+6CsALXaIUylcclS0eCjV7ocyrhXDVXrn9
 ZuAEKYWZdmKybJSIW7wyD5/RALiS3vG2L7+PNHZKVSv4ewZz7my+TFUTOCbJeiVlyXo+QWpIHwh
 0a+xgbxcOpPhaqHTZ7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170014



On 11/16/2026 7:41 PM, George Moussalem wrote:
> On 11/12/26 19:57, Davíð Steinn Geirsson wrote:
>> The GCC has a block reset (BCR) and an AHB clock branch for each of the
>> two MDIO controllers. The pair at 0x58000/0x58004 belongs to the
>> controller at 0x90000 (mdio1 in ipq5018.dtsi) and the pair at
>> 0x58010/0x58014 belongs to the controller at 0x88000 (mdio0). The driver
>> maps the GCC_MDIO0_* IDs to the first pair and the GCC_MDIO1_* IDs to
>> the second, so each MDIO node gets the clock and reset of the other
>> controller.
>>
>> ipq5018.dtsi enables mdio0 and leaves mdio1 disabled. On a board that
>> does not enable mdio1, clk_disable_unused() gates 0x58014 and the
>> controller at 0x88000 stops responding. Its registers then read back a
>> stale bus value, so MDIO reads return garbage instead of failing.
>>
>> Observed on a Ubiquiti UniFi 6 Pro, which has the internal GE PHY on
>> mdio0 and nothing on mdio1:
>> - Gating 0x58004 leaves the 0x88000 controller working and every
>>   0x90000 register reads 0xffff. Gating 0x58014 does the reverse.
>> - Asserting the BCR at 0x58000 resets the 0x90000 controller and halts
>>   the 0x58004 branch. The BCR at 0x58010 resets the 0x88000 controller
>>   and halts the 0x58014 branch.
>>
>> Swap the clock and reset offsets so that each ID controls the
>> controller it is named after. No in-tree DT uses the MDIO resets.
> 
> confirmed working on Linksys MX2000 and MR5500. Both devices don't have
> the internal GE PHY on mdio0 wired up. With mdio1 enabled and mdio0
> disabled, ethernet comes up.
> 
> Adding Luo Jie: I think this patch can be reverted because not all
> boards use the internal GE PHY and its LDO needs not be enabled for
> ethernet functionality on externally connected PHYs or switches
> controlled by mdio1
> -
> https://lore.kernel.org/all/20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com/
> 
> Tested-by: George Moussalem <george.moussalem@outlook.com>
> 

Thanks for testing on the MX2000 and MR5500.

All of the Qualcomm RDP boards have the internal GE PHY, so it makes
sense to keep it enabled by default. A board that doesn't use the
internal GE PHY can disable it in its own board DTS, as you already
did for the MX2000 and MR5500:

	&mdio0 {
		status = "disabled";
	};

>>
>> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
>> Signed-off-by: Davíð Steinn Geirsson <david@dsg.is>
>> ---
>>
>> Tested and confirmed working on the Ubiquiti U6 Pro with both
>> OpenWRT's v6.18.60 kernel and `qcom/clk-for-7.5`.
>>
>> A comment in OpenWRT's `ipq5018-archer-ax55-v1.dts` indicates this
>> bug has bitten people before:
>> https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/dts/ipq5018-archer-ax55-v1.dts#L273-L279
>> That workaround should become unnecessary with this patch, though I
>> do not have the right hardware to confirm that.
>>
>> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
>> index 37ccdc44a8..bf1a4745d1 100644
>> --- a/drivers/clk/qcom/gcc-ipq5018.c
>> +++ b/drivers/clk/qcom/gcc-ipq5018.c
>> @@ -1969,28 +1969,28 @@
>>  };
>>  
>>  static struct clk_branch gcc_mdio0_ahb_clk = {
>> +	.halt_reg = 0x58014,
>> +	.clkr = {
>> +		.enable_reg = 0x58014,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data) {
>> +			.name = "gcc_mdioi0_ahb_clk",
>> +			.parent_hws = (const struct clk_hw *[]) {
>> +				&pcnoc_clk_src.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch gcc_mdio1_ahb_clk = {
>>  	.halt_reg = 0x58004,
>>  	.clkr = {
>>  		.enable_reg = 0x58004,
>>  		.enable_mask = BIT(0),
>>  		.hw.init = &(struct clk_init_data) {
>> -			.name = "gcc_mdioi0_ahb_clk",
>> -			.parent_hws = (const struct clk_hw *[]) {
>> -				&pcnoc_clk_src.hw,
>> -			},
>> -			.num_parents = 1,
>> -			.flags = CLK_SET_RATE_PARENT,
>> -			.ops = &clk_branch2_ops,
>> -		},
>> -	},
>> -};
>> -
>> -static struct clk_branch gcc_mdio1_ahb_clk = {
>> -	.halt_reg = 0x58014,
>> -	.clkr = {
>> -		.enable_reg = 0x58014,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data) {
>>  			.name = "gcc_mdio1_ahb_clk",
>>  			.parent_hws = (const struct clk_hw *[]) {
>>  				&pcnoc_clk_src.hw,
>> @@ -3585,8 +3585,8 @@
>>  	[GCC_GMAC1_SYS_ARES] = { 0x68438, 1 },
>>  	[GCC_IMEM_BCR] = { 0x0e000, 0 },
>>  	[GCC_LPASS_BCR] = { 0x2e000, 0 },
>> -	[GCC_MDIO0_BCR] = { 0x58000, 0 },
>> -	[GCC_MDIO1_BCR] = { 0x58010, 0 },
>> +	[GCC_MDIO0_BCR] = { 0x58010, 0 },
>> +	[GCC_MDIO1_BCR] = { 0x58000, 0 },
>>  	[GCC_MPM_BCR] = { 0x2c000, 0 },
>>  	[GCC_PCIE0_BCR] = { 0x75004, 0 },
>>  	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x750a8, 0 },

The GCC driver is correct here. GCC_MDIO0_AHB_CLK (0x58004) and
GCC_MDIO1_AHB_CLK (0x58014), along with the matching BCRs, follow the
IPQ5018 hardware register definitions. What is wrong is the clock
assignment in ipq5018.dtsi: the MDIO controller at 0x88000 is clocked
by GCC_MDIO1_AHB_CLK, and the controller at 0x90000 is clocked by
GCC_MDIO0_AHB_CLK.


Please drop this change and fix the DTS instead, for example:

--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -220,7 +220,7 @@ mdio0: mdio@88000 {
                        #address-cells = <1>;
                        #size-cells = <0>;

-                       clocks = <&gcc GCC_MDIO0_AHB_CLK>;
+                       clocks = <&gcc GCC_MDIO1_AHB_CLK>;
                        clock-names = "gcc_mdio_ahb_clk";
                        clock-frequency = <6250000>;

@@ -243,7 +243,7 @@ mdio1: mdio@90000 {
                        pinctrl-0 = <&mdio_pins>;
                        pinctrl-names = "default";

-                       clocks = <&gcc GCC_MDIO1_AHB_CLK>;
+                       clocks = <&gcc GCC_MDIO0_AHB_CLK>;
                        clock-names = "gcc_mdio_ahb_clk";

                        status = "disabled";
