Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4624B4483BE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022832; cv=none; b=VwFl+1o8K664ehtflVDSxe6Hlvs1iEhixgHJd9wjGNQ7PPoqPRIgFmzHkjXBv+VFT3/nz3VN3rcIxuTTyD/wxITIYewVRop+iCOFG7ZhB3srQuQ3Y08638lwrCWtN27o3K6Ukq686BivNoAYDgjTtJ6S/JEQV8rELpyHfZEW6l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022832; c=relaxed/simple;
	bh=f7WRjxKOHBMfsIJamOML888Yxmjo/45+H6USSEmY6xk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KU6b0Y9NSZ4wFN7tPqDrX+fDUiuP5316Bx5ZfYJmFH/3/P+rJaO4T2PWwyyljy3qC27KorBSyfDSyj+adz6DC9BEdloOG/aArk5CuzpYgqyg5QmGPU1NoZPsWjCjXohI/z83GJMDW/i+ohGtgT9YGzaI0ds7UtgFLFLxTJFiRZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsBSXam1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpuvtQz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsBSXam1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpuvtQz4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFB5kE2013696
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iy80AsOZHRNcUBTubyA96vqdJ7FUw9bhktjWiGsE8rM=; b=lsBSXam1yb95DOHH
	1ZF0xQDaQsg0Mmic3yvbj8Ue33E+lhtur34wgJyXQ8mlnH0hCSVrVfFkof6oegO+
	j3HrTTgn54HR/6O1r1SPvgeavEa4SgdG911Raf2TsftjlSH/57x8WIdZgYLBewgE
	7T3OFUVruuKrJ9kkL13sHwZYlNKkG2CgN6k3mwR1gYyhQMng2qjzFvER6efrEeZM
	78fLBhwlaAXGSEJtUmfqIS4ojpmTa7F15i8/QSOQn+PT8RidHizqiVe2Pk+FG8hT
	CvioYO2+QiWVnKRl4WkzeKs2YV/Wxaclx+D+UqX4M7UsybjloiH1oPpImne9crec
	CZlmxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d3820-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:33:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd53f2b27cso42384115ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022828; x=1790627628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iy80AsOZHRNcUBTubyA96vqdJ7FUw9bhktjWiGsE8rM=;
        b=GpuvtQz4mN2ofKJfCz1LKU7y/Ysu5vrSMVDiF9suUjcT0ka9Vg8k68TN4tN+G3bDDt
         wA2Stkq524AILF3vvOuHN0wTgAAPrdzC7g3wawRQn8penHS4LKlzMAZZ2cwIDP3fsDlw
         /drvzLLFtGtFoPHnLNoUTyQvjMPlQdHoJM7aPd0PuQ0d6vW6a1ow4yAK+u1lY60vD59x
         VSlbe2VKFu0Mwu+AqCWavm3rO779svuyu+ubQc7r9vQUfe1/IgWeaeGNrlyhe6vX1xZM
         gHhF+99Ph/uIgoX62IuIiA8EF2mZN0agsIrcozK3D+DgjbkwAavJqFQlpYTzDWavy/yu
         JVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022828; x=1790627628;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iy80AsOZHRNcUBTubyA96vqdJ7FUw9bhktjWiGsE8rM=;
        b=af0cX7Lh+SVzrDZuFritvABC5kCiZuOzGLyiTFYq+KBCJDXVD2ACL2F2q4+k5WzXly
         fWB0EqNptEPbk3V2l+e4aEuaV7+KdUJ7bw+cayqjXHst6r0zw1/O3Be7o7V3coToRi7H
         Hr5K8ZpHsrRSPtX00OYov6S5hcJz4GGtF4G5v1JhCQlC+hfHT3pFX0jWZ21zVaUL4Sax
         +xrR2v1IapJO5QMOBTf2hKogej4w3lQAShpvTr9rDCEKGTCb7DBI4QUYOdKkd6jeIF1a
         LLLfAsBzPGC7kpSC6nWQMkrK2HjDesR/zSJjXltnmfsfhSHflRMwvuY68032CXsUXm6a
         6e1g==
X-Forwarded-Encrypted: i=1; AKwUvBxAZ43ZQDW735Nk4xdjq9unPFxTcBgRDQf0kOvDRSozRLv+p7GqsNnkt0bG9fEsOJw1vbz4ar46S2kMJLU=@vger.kernel.org
X-Gm-Message-State: AFuF++k6FoKkcmsltDDqHYbAEkA7bhfJ4QMJcY5mwgm5/GUBEpeHdYhJ
	oNNQPPx+dQvHQai9zUezpe9SbLNE5LaRuTBO+1bobXq+dZWGAcJZ7HaSqXAU3ZeXxrRcfpGuA+C
	KQo/4v4wsNRmsAkQneKJu5glOa3g4df7eof0cyg6fgd7rQkd5NTayOd0QF9NRFer9O8E=
X-Gm-Gg: AYBFou2IzrQhuaUtMCMLBn8HGOhinSzHWVAkudjjEbUqburO5LjvFVKrn56SXPoa/43
	I3qcNhbaB7iomXKH8+H72cEn4aliUG76r5scHukQVFb6mQIbRZLvXOtODnn1r/29EJ5E/mrK8bm
	nZzVlQCB04J32N/Gppzz3GsSo4EtSsnV6+ZpDWGbd/KGDuBg1tRaMeZ0+0+a0lxVkWWjmeEfzL2
	MKQv9IzyI22HYE+7t82gvP3fmPlkFM0+ISRvDDOlvjQQ/57JIWZw1eUi6QrPIpG8PmfskKDQOpT
	6Mx15/iox0NGIWNI0lxbYhKXvtkypnbSTuiWW9JSiPoooMsSGrdOowRDl9Uo13fQT2Zimu7pf/w
	xcBbd79i1+OUEzSVG8OsLaUh71iwD8SC8
X-Received: by 2002:a17:902:fc85:b0:2dd:c053:d73c with SMTP id d9443c01a7336-2ddc053d7f6mr109463575ad.35.1790022827920;
        Mon, 21 Sep 2026 13:33:47 -0700 (PDT)
X-Received: by 2002:a17:902:fc85:b0:2dd:c053:d73c with SMTP id d9443c01a7336-2ddc053d7f6mr109463265ad.35.1790022827293;
        Mon, 21 Sep 2026 13:33:47 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec4e584sm414448eec.27.2026.09.21.13.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:33:46 -0700 (PDT)
Message-ID: <5fd459ab-0ce7-46f8-a296-7c063055922a@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:03:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank.Li@nxp.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
 <010c05cf-66dc-4288-ba3f-81f8f4634525@kernel.org>
Content-Language: en-US
In-Reply-To: <010c05cf-66dc-4288-ba3f-81f8f4634525@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 89_yL9uhZkm0W2Om3O4uQk6SWdBPSU07
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfXxieY5AjesMuP
 cnVoIQ/YSRemhkO770fXio36QJZ1nODWpUPVvLQaFZThqGNFZTuUpj0ZuhyLKrQGyhF70853ug2
 KbFUyxojPSag0KoXPXh6OA+W2+nSbng=
X-Proofpoint-GUID: 89_yL9uhZkm0W2Om3O4uQk6SWdBPSU07
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab194ad cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OgTVopdsg-nk9eQGwA0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX0O0gfzi6Y0/I
 i8bJ2WeC/E+q9p90DCs7ooWhCpkZsJhUZILp4I4PtVQpsBVtou4rDb70Efl6KlXzvSGAKv83/Vw
 hgTHJgRu3h6hrL5NE7LQwJDIJxex+ed4Ee787+yRJDoQAzF8rstkF5lo0C5CTOwUgXMbbhO2Dj8
 l62eCRckhlK/U2Z+3qTttrB6eh5MMoMyVSXcM4TJ41fsueA08/Did+7nvQ+rCBQzIqK6Q0cWpUk
 5TQUp+ClMq3YrA9BU2G8Oe56g3I3cbuJFRpRhwE2PYysaHsgzYGCOcMfhrZPa8FzM+zEgk6b1dy
 jwUxGeD1+CyVHy7EDXPUzH9i2QR37zRDdo35r48rVgLXNzKu/3Tvi3nX72fRxFG0yLAoWM/gjPK
 XLqj2aQ6G6ShiPMLyFMy9eUn3hS9tDsifj/6seE1G9ozAVhFlC4X1MT/UYR2qA3qqC9fGYBwsWG
 QYFgPz7EYJ95zUkOR8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210300

Thanks Kryzsztof for the review !

Apologies for the delayed response. I was waiting to verify the changes 
and ensure all the suggested updates were properly incorporated. The 
effort was further delayed due to some slave-side setup issues.

I have now addressed and validated all the suggested changes except one, 
which I have responded to separately below. I shall upload V7 soon with 
all the suggested changes.


On 7/1/2025 2:13 PM, Krzysztof Kozlowski wrote:
> On 01/07/2025 09:18, Mukesh Kumar Savaliya wrote:
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/i3c/master.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
> 
> where do you use it?
> 
Removed it.
> 
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> 
> where do you use it?
> 
Removed it
> 
>> +#include <linux/of_platform.h>
> 
> where do you use it?
> 
Removed it

>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/slab.h>
>> +#include <linux/soc/qcom/geni-se.h>
>> +#include <linux/units.h>
> 
> where do you use it?
Using for frequency units - HZ_PER_KHZ, HZ_PER_MHZ.
geni_i3c_clk_map[] table.

>> +#define SE_I3C_SCL_HIGH                 0x268
>> +#define SE_I3C_TX_TRANS_LEN             0x26c
>> +#define SE_I3C_RX_TRANS_LEN             0x270
>> +#define SE_I3C_DELAY_COUNTER            0x274
>> +#define SE_I2C_SCL_COUNTERS             0x278
>> +#define SE_I3C_SCL_CYCLE                0x27c
>> +#define SE_GENI_HW_IRQ_EN               0x920
>> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
>> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
>> +
>> +/* HW I3C IBI interrupt enable */
>> +#define M_IBI_IRQ_EN			BIT(0)
>> +
>> +/* M_IBI_IRQ_IGNORE */
>> +#define M_IBI_IRQ_IGNORE		BIT(0)
>> +
>> +/* SE_GENI_M_CLK_CFG field shifts */
>> +#define	CLK_DIV_VALUE_MASK		GENMASK(23, 4)
>> +#define SER_CLK_EN			BIT(0)
>> +
>> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field bits */
>> +#define M_IBI_IRQ_PARAM_7E		BIT(0)
>> +#define M_IBI_IRQ_PARAM_STOP_STALL	BIT(1)
>> +
>> +/* SE_I2C_SCL_COUNTERS field shifts */
>> +#define I2C_SCL_HIGH_COUNTER_MASK	GENMASK(29, 20)
>> +#define I2C_SCL_LOW_COUNTER_MASK	GENMASK(19, 10)
>> +#define I2C_SCL_CYCLE_COUNTER_MASK	GENMASK(9, 0)
>> +
>> +#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
>> +	M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
>> +	M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
>> +
>> +/* M_CMD OP codes for I2C/I3C */
>> +#define I3C_READ_IBI_HW          0
>> +#define I2C_WRITE                1
>> +#define I2C_READ                 2
>> +#define I2C_WRITE_READ           3
>> +#define I2C_ADDR_ONLY            4
>> +#define I3C_INBAND_RESET         5
>> +#define I2C_BUS_CLEAR            6
>> +#define I2C_STOP_ON_BUS          7
>> +#define I3C_HDR_DDR_EXIT         8
>> +#define I3C_PRIVATE_WRITE        9
>> +#define I3C_PRIVATE_READ         10
>> +#define I3C_HDR_DDR_WRITE        11
>> +#define I3C_HDR_DDR_READ         12
>> +#define I3C_DIRECT_CCC_ADDR_ONLY 13
>> +#define I3C_BCAST_CCC_ADDR_ONLY  14
>> +#define I3C_READ_IBI             15
>> +#define I3C_BCAST_CCC_WRITE      16
>> +#define I3C_DIRECT_CCC_WRITE     17
>> +#define I3C_DIRECT_CCC_READ      18
>> +
>> +/* M_CMD params for I3C */
>> +#define PRE_CMD_DELAY		BIT(0)
>> +#define TIMESTAMP_BEFORE	BIT(1)
>> +#define STOP_STRETCH		BIT(2)
>> +#define TIMESTAMP_AFTER		BIT(3)
>> +#define POST_COMMAND_DELAY	BIT(4)
>> +#define IGNORE_ADD_NACK		BIT(6)
>> +#define READ_FINISHED_WITH_ACK	BIT(7)
>> +#define CONTINUOUS_MODE_DAA	BIT(8)
>> +
>> +#define SLAVE_ADDR_MASK		GENMASK(15, 9)
>> +
>> +#define CCC_HDR_CMD_MSK		GENMASK(23, 16)
>> +#define IBI_NACK_TBL_CTRL	BIT(24)
>> +#define USE_7E			BIT(25)
>> +#define BYPASS_ADDR_PHASE	BIT(26)
>> +
>> +/* GSI callback error fields - DMA_TX_IRQ_STAT */
>> +#define GP_IRQ0			BIT(5)
>> +#define GP_IRQ1			BIT(6)
>> +#define GP_IRQ2			BIT(7)
>> +#define GP_IRQ3			BIT(8)
>> +#define GP_IRQ4			BIT(9)
>> +#define GP_IRQ5			BIT(10)
>> +#define DM_I3C_CB_ERR		GENMASK(10, 5)
>> +
>> +#define I3C_AUTO_SUSPEND_DELAY	250
>> +#define PACKING_BYTES_PER_WORD	4
>> +#define XFER_TIMEOUT		250
>> +#define DFS_INDEX_MAX		7
>> +
>> +#define I3C_ADDR_MASK		I2C_MAX_ADDR
>> +
>> +enum geni_i3c_err_code {
>> +	RD_TERM,
>> +	NACK,
>> +	CRC_ERR,
>> +	BUS_PROTO,
>> +	NACK_7E,
>> +	NACK_IBI,
>> +	GENI_OVERRUN,
>> +	GENI_ILLEGAL_CMD,
>> +	GENI_ABORT_DONE,
>> +	GENI_TIMEOUT,
>> +};
>> +
>> +enum i3c_bus_phase {
>> +	OPEN_DRAIN_MODE  = 0,
>> +	PUSH_PULL_MODE   = 1
>> +};
>> +
>> +struct geni_i3c_dev {
>> +	struct geni_se se;
>> +	unsigned int tx_wm;
>> +	int irq;
>> +	int err;
>> +	struct i3c_master_controller ctrlr;
>> +	struct completion done;
>> +	/* Protects per device CCC command or transfer from get_mutex_lock()/unlock() wrapper */
>> +	struct mutex lock;
>> +	/* Per device protection between process and IRQ context */
>> +	spinlock_t irq_lock;
>> +	u32 clk_src_freq;
>> +	u8 *cur_buf;
>> +	bool cur_is_write;
>> +	int cur_len;
>> +	int cur_idx;
>> +	DECLARE_BITMAP(newaddrslots, 64);
>> +
>> +	const struct geni_i3c_clk_settings *clk_cfg;
>> +	const struct geni_i3c_clk_settings *clk_od_cfg;
>> +};
>> +
>> +struct geni_i3c_i2c_dev_data {
>> +	u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy for now */
>> +};
>> +
>> +struct geni_i3c_xfer_params {
>> +	enum geni_se_xfer_mode mode;
>> +	u32 m_cmd;
>> +	u32 m_param;
>> +};
>> +
>> +static inline struct geni_i3c_dev *to_geni_i3c_master(struct i3c_master_controller
>> +							*master)
>> +{
>> +	return container_of(master, struct geni_i3c_dev, ctrlr);
>> +}
>> +
>> +struct geni_i3c_clk_settings {
>> +	u32 clk_freq_out;
>> +	u32 clk_src_freq;
>> +	u8  clk_div;
>> +	u8  i2c_t_high_cnt;
>> +	u8  i2c_t_low_cnt;
>> +	u8  i3c_t_high_cnt;
>> +	u8  i3c_t_cycle_cnt;
>> +	u8  i2c_t_cycle_cnt;
>> +};
>> +
>> +/*
>> + * The hardware uses the following formulas to calculate the time periods
>> + * of the SCL clock cycle. The firmware adds a few extra cycles that are not
>> + * included in the formulas below. It has been verified that the resulting
>> + * timings remain within the I2C/I3C specification limits.
>> + *
>> + * I2C SCL high period:
>> + *     i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
>> + *
>> + * I2C SCL low period:
>> + *     i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
>> + *
>> + * I2C SCL full cycle:
>> + *     i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
>> + *
>> + * I3C SCL high period:
>> + *     i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
>> + *
>> + * I3C SCL full cycle:
>> + *     i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
>> + *
>> + * Output clock frequency:
>> + *     clk_freq_out = t / t_cycle
>> + */
>> +static const struct geni_i3c_clk_settings geni_i3c_clk_map[] = {
>> +	{
>> +		.clk_freq_out = 100 * HZ_PER_KHZ,
>> +		.clk_src_freq = 19200 * HZ_PER_KHZ,
>> +		.clk_div = 1,
>> +		.i2c_t_high_cnt = 76,
>> +		.i2c_t_low_cnt = 90,
>> +		.i3c_t_high_cnt = 7,
>> +		.i3c_t_cycle_cnt = 8,
>> +		.i2c_t_cycle_cnt = 192,
>> +	},
>> +	{
>> +		.clk_freq_out = 400 * HZ_PER_KHZ,
>> +		.clk_src_freq = 19200 * HZ_PER_KHZ,
>> +		.clk_div = 1,
>> +		.i2c_t_high_cnt = 12,
>> +		.i2c_t_low_cnt = 24,
>> +		.i3c_t_high_cnt = 7,
>> +		.i3c_t_cycle_cnt = 8,
>> +		.i2c_t_cycle_cnt = 48
>> +	},
>> +	{
>> +		.clk_freq_out = 1000 * HZ_PER_KHZ,
>> +		.clk_src_freq = 19200 * HZ_PER_KHZ,
>> +		.clk_div = 1,
>> +		.i2c_t_high_cnt = 4,
>> +		.i2c_t_low_cnt = 9,
>> +		.i3c_t_high_cnt = 7,
>> +		.i3c_t_cycle_cnt = 0,
>> +		.i2c_t_cycle_cnt = 19
>> +	},
>> +	{
>> +		.clk_freq_out = 12500 * HZ_PER_KHZ,
>> +		.clk_src_freq = 100000 * HZ_PER_KHZ,
>> +		.clk_div = 1,
>> +		.i2c_t_high_cnt = 45,
>> +		.i2c_t_low_cnt = 63,
>> +		.i3c_t_high_cnt = 6,
>> +		.i3c_t_cycle_cnt = 7,
>> +		.i2c_t_cycle_cnt = 110
>> +	}
>> +};
>> +
>> +static int geni_i3c_clk_map_idx(struct geni_i3c_dev *gi3c)
>> +{
>> +	const struct geni_i3c_clk_settings *clk_idx = geni_i3c_clk_map;
>> +	struct i3c_master_controller *m = &gi3c->ctrlr;
>> +	struct i3c_bus *bus = i3c_master_get_bus(m);
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(geni_i3c_clk_map); i++, clk_idx++) {
>> +		if (clk_idx->clk_freq_out == bus->scl_rate.i3c &&
>> +		    clk_idx->clk_src_freq == gi3c->clk_src_freq)
>> +			gi3c->clk_cfg = clk_idx;
>> +
>> +		if (clk_idx->clk_freq_out == bus->scl_rate.i2c)
>> +			gi3c->clk_od_cfg = clk_idx;
>> +	}
>> +
>> +	if (!gi3c->clk_cfg || !gi3c->clk_od_cfg)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static inline void set_new_addr_slot(unsigned long *addrslot, u8 addr)
> 
> Why do you mark functions inline? Drop, it's not recommended style.
> 
Sure, Done.
>> +{
>> +	if (addr > I3C_ADDR_MASK)
>> +		return;
> 
> This seems redundant. Why are you checking it every time here, but not
> once in the loop where this is executed?
> 
> This is confusing - you got incorrect address in the place where this is
> called ("if (new_device) {") but you do not handle incorrect address,
> don't fail, don't unwind, don't handle the error. Instead this part
> silently skips the issue but rest of code will work with that incorrect
> address.
> 
I’ll drop inline. I’ll validate the new dynamic address once at the 
new_device handling site and treat invalid addresses as an error, so we 
don’t silently proceed with a bad address. Helpers will assume validated 
input and won’t hide error paths.
> 
> 
>> +
>> +	set_bit(addr, addrslot);> +}
>> +
>> +static inline void clear_new_addr_slot(unsigned long *addrslot, u8 addr)
>> +{
>> +	if (addr > I3C_ADDR_MASK)
>> +		return;
> 
> And is_new_addr_slot_set() does not have the test? And how is this even
> possible, aren't you looping till I3C_ADDR_MASK?
> 

Fixed the error handling at the caller.

> I understand why you wanted some abstractions, but this caused hiding
> actual issues because you do not see big picture.
Sure, made the changes accordingly.
>> +
>> +	clear_bit(addr, addrslot);
>> +}
> 
> 
> 
> ...
> 
> 
>> +
>> +static const struct i3c_master_controller_ops geni_i3c_master_ops = {
>> +	.bus_init = geni_i3c_master_bus_init,
>> +	.bus_cleanup = NULL,
>> +	.do_daa = geni_i3c_master_do_daa,
>> +	.attach_i3c_dev = geni_i3c_master_attach_i3c_dev,
>> +	.reattach_i3c_dev = NULL,
>> +	.detach_i3c_dev = geni_i3c_master_detach_i3c_dev,
>> +	.attach_i2c_dev = geni_i3c_master_attach_i2c_dev,
>> +	.detach_i2c_dev = geni_i3c_master_detach_i2c_dev,
>> +	.supports_ccc_cmd = geni_i3c_master_supports_ccc_cmd,
>> +	.send_ccc_cmd = geni_i3c_master_send_ccc_cmd,
>> +	.priv_xfers = geni_i3c_master_priv_xfers,
>> +	.i2c_xfers = geni_i3c_master_i2c_xfers,
>> +	.enable_ibi = NULL,
>> +	.disable_ibi = NULL,
>> +	.request_ibi = NULL,
>> +	.free_ibi = NULL,
>> +	.recycle_ibi_slot = NULL,
>> +};
>> +
>> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
>> +{
>> +	int ret;
>> +
>> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(gi3c->se.base))
>> +		return PTR_ERR(gi3c->se.base);
>> +
>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(gi3c->se.clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
>> +							"Unable to get serial engine core clock: %pe\n",
> 
> Messed alignment.
> 
Fixed.

>> +							gi3c->se.clk);
>> +	ret = geni_icc_get(&gi3c->se, NULL);
>> +	if (ret)
>> +		return ret;
>> +
> Best regards,
> Krzysztof

