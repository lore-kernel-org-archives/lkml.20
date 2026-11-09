Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218869;
	b=ViDIRCm9PdmTt5T67b+Hgd8IiWAcOZ1t7j9/Bbo7eZNryk80ZO1lQvV3rsMMAin2TLjv
	 DesqK+/KF2KOydh+gHc9wmqZ/1Os60ln0VEbrYKZjLPWsRomI1QtiRep6uMKiwNDG4F1G
	 LGf9craJevfiCP0GRnV3YBSuycbm5QytsqYHlPV96WFhDLJn6P1EZ00FmGBEn5J8CQf7B
	 1v8/9WCJ9fAv4kzj4HAnYRPE/FMAOhp9j/YxRuWAb1Ro1xrgOE7c5+TZWa8tyra3Mx2Iq
	 knvuhZO5Rccg0Gn7PYQo/ympfopClbPnXWkKTraRwCKjix+McGFMfaNH2Rj7bytUrvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
	b=pIQuxedLBrtfse4GuP1X35QUBFPS4ihJx7DpqjfVqOEhMVSeO5mrw/OBSVLXs/h0IiRj
	 /L6Oj8wy1Std3AofDwAzjMrp61KPbDQU6KKdLdJW1a4oO3CGp6UecJoteEe2xkNeoDpqr
	 smQhsZHfz/ssN6so/7LwWZhvJMxccHirHZyVz1Yy8ukBZAcW8vgFeENm6SE02mey4ZlwD
	 h5Zphj7eSkKyMX4OT9qVd7PC4EIjoMR5Xz4VsnFKcXlVcUdumXKc6XrSYCqFeUg9CsCPT
	 Yg9FBbi6r8F++qJosVluF++esCouN/KP8JbdbxDamzB0ELBDcoiiR9z4HonzU/8LmAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNbsAyBB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b+K1h3dp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA4606D80F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBDA4606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNbsAyBB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b+K1h3dp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99unZg4077650
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=bNbsAyBBBX47e9R8
	e/n73IMqaFJxB50b05woDjdvPpwV/cafqvJ6Y+b2MXb//LgN0+r2Oz/Mjp7Zrz5S
	AxSiaEhKEs7Z1O0RaThalq0vYzPwOWIguspYyVKuo9+BVS8PIq+ELy6TFU03pyrc
	Db/G5joaV1/eZVI7Km6Ztx/vyRIp+xH1WeXV7AyEmBZ375TI9Vo08cv5glb9/PgP
	CF1Wild9WOZT4j/tjtlsdxAu23epLhz0uAe4DW4AGhv1V8bf5dWsnmQyoX9xPOqK
	ao/YNQZI8NB7944kQORemBL/Ovq/7RYn0VofNKam3iD3LPmW4c4cE962v0NpK9Zv
	hd1ujg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735s3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:07:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a098dbc7so740274a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218866; x=1794823666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=b+K1h3dp0NzQQVOU/hq+Yhw3Xc5B/wcOXWGdNhbmpfkOcG5sX8FzBD9z4uj5fqyjdF
         O/hi/XGa9qVBt/3zIC0Mm0nehYYSqOW/1cbxTpr8K4wwKYjSyHw7H+wrtAkM1X+TEz/V
         NfTYYS45rVbwm2LDPoQPNwGaVvY65osZNNrfqhWmYVNEShjpz068M74s3nFwFjzg444s
         nNRVwjBE63hBTo2F7R3tk0bXSwNxROF3kjgzymDaCxaqW3X/4gLhfZnzpADCXJfgCkNN
         GPXM8PtNmeHD7qIFCOjd4aXEaoSOMPDyPuses7u1/OSwgcTqW10FkEOkk2717xOHlpRG
         eg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218866; x=1794823666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=cM86fHV4jxDIm63t0a+Sm84vrx2zFPO0ZTcE1UgBbNvkKFbcG0K4BbZtsM0lYwPHWc
         AzfPEz9uehAelu1MWiRT3qdEyWhn2jWwqfikZO5nqlnze96mqNMPAR2knRb0kWG6VTxi
         Fh9MxzHOfSQ1rdSqGSzlSzPIvB1Dm3y0aU0VQ85Vi8r/pklFEMNvJWaORPpqrDkirTlm
         hY0pP07MJTrs5g/8b2hu+wIJN/7vCueznNef+4HcHYy+Z/0ksc1nj0O59wrW3kxfHh3u
         2vWS7gD1H++9Q24U5V2b2Jj/Vqrt8ipizpmnncDhOWc1Tb8Oi88zq+z9MfsasrlNO7sy
         46Ew==
X-Forwarded-Encrypted: i=1; AL+hErF2Bqmi0KnwqqEBjj44g5a3cLgSxcuPmqMiy1sTMKtVoXULrubEMSR+8N7/gVADv+dtf4VbXqGEWe5b7/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NoUt9j3Hd6I01D0CRGKUlKKW1OvG2Bjw81Cr1ESJFZxEGCy0P
	hKRJ/5BnZsyzZhwo9vYVl5fkvdQxL+kDwdac6PEughpE+B4/vQGzGVdzxrtaywAAeNWNrW1zQXA
	M1W99z+PV1OdH8MTsXrIxZUget1HBVNYg0xLx3WJT3mG0jvyb23gsc3qdqdeybD0JLao=
X-Gm-Gg: AYBFou3Dq0vJfC0UVHCVmoIJrtBfXJcaNZr1JO6XzvBQCuCKUQY4P5gc14ZfWzDuHvP
	YPy0B+DgAkmPSIF2+KiBD41oZST2jeLvT4/x7YpKeLJg/9RA3gITQQcyThK2Uvj4y14AYHsGj/v
	0Nl7PWjGtlvraGdz/i7rUaAGS9uYrH0d5IqG31mA5njUv44NctBFpiAOg60wFWUeHmt1ti2kfvL
	aivhxNioP9cSstHhqcnazDAYju/YHtbPEfv08r4IovhUcBmtaBEbKctG8jNwHmVBwekfswJrEye
	TNh2jFa8687hF93hET+tgr6lAbaxvAWJeS/43Uu/X7/hyOzbcLr3HYLk/0Wf6RNqp+FLHM3+oI/
	EnzP3cIQyXJlBTZqm659xuNe+7DTqDjcEvN3vrjucpsFpKdrX6jsthlPTORPKBH3tGt8P1U2Xzm
	EVsfyQHKD5l185coz6TIfNAMpi15wI
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr3363417a91.23.1794218866286;
        Mon, 09 Nov 2026 02:07:46 -0800 (PST)
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr3363381a91.23.1794218865811;
        Mon, 09 Nov 2026 02:07:45 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:45 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:36 +0800
Subject: [PATCH v5 4/7] cacheinfo: Expose the code to generate a cache-id
 from a device_node
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-4-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218817; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=ozOGB6eLM9+WzelhJAT3yEtCsqCzkfhBnvd8PVWm2gJ8zV1FxEktehv06soBEhpURkRFYpAcE
 GrCUpKAbEj+AXLMisyOFGQJAee0jz2pKuUsGzIKusD+cqkcXHut3kO1
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX5auyAvFgl3Q2
 wpNs3xlp9jB6689OGg0uQZ3pESTayMpz6M1KHiWB5vzQ38FICSFGOnSnghWFeYU4i4gk6FAmTAA
 NDtVzrYKPJE0RiUaRb27yIAPiqR5GtKnvruGAGbyQ5zBt88wTiFYM/A+kcRX49QlUoIIuCgaYKd
 tlmO0Q2bAamqgSx5hKg9yffApz74heH5NmW2q6zzSLlS4yqzxg2MVBeqN8F/FCyvVQqlwBW5WwZ
 BhTwlmwuk9fdvDtlLI7ZklpPAWLMqWhM+O6DtWz5oinJP71nod1JSDCdHII7XPswgapuhvd6zmK
 0/wBU+IigQZxcg3XK98DcD+EJkJMTcfVzjCAuaodIXnofiJdczydywN/6kQZWbBvE/6R2VH1GZz
 r6X98jCAHYCSGYYhkWbW5rR3vyv5xO62B6QxzCy6t4MS9jpmmqzTuEWKWeHho9FVm5TEP9BBBW2
 6m5KoSjUOtbKsNHzPVQ==
X-Proofpoint-ORIG-GUID: OFuAIfiGB2ZbrHduMSJXvERnQ4kJdAUp
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af19b73 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXzuriCyWXmuI+
 rvWfkfMRrtAThvU65zqu5i3PWp4WNugdjWJJ641lcHXT/garYf/xxUpBlx/XQ1dtPm8rntuT2/t
 F3mXUSwOcYGolYUnJvsLernJ3EBGJ/Q=
X-Proofpoint-GUID: OFuAIfiGB2ZbrHduMSJXvERnQ4kJdAUp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index eb8a907f6d50..a4b10f3a9007 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1

