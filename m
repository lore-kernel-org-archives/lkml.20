Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351452;
	b=SkpnubbzgE0a18hYT2fJaZtYlewQJqLCAj8SuncJXl6o2Jhzpgo0yWasdwMLkocwi8Bz
	 lqbz7vxUbyKrHPc9L3tnikVlITGwKRvrsHA5o33UWuvrkzbvHm8MjpGDTjkkJgc2Kl4e9
	 tuCvAS1l7HJibyzp1VstNgMki1U2UVTXPsf0SDy7Hwm8Z0rxHpmHsDbftcFWrLPIdCSux
	 JOf4ZJdM9coep5EP4d580and+rs7Q7FxnVlTr7BJiSXLggYZfclx9DtNd2AXC1xccLLVg
	 vsWPKfR3GbmZzR4IpdwYFuGNi0AM1OpInbqSLoxXZ+X11CAhSBysvKb+oXMlSDrLC6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
	b=wHitoo4H8CyqrfY409LZPsJg/IAfvreXSkRGTgj1ESffBF+HsnINzm7x22XDLq8OBky2
	 +qAxpmWC6Lg9fgiZRX+vRyrEXyEbsnlDFH2ISCynaswTigjLu1nBQlFWRe5r9x7SE0/Vo
	 P5cyzda2XpMCFKwt1EUsf3Mb89Fw/LvDROwGJMIkQFjCfQdYQOBONUKszZCFZbJpqUPuT
	 JBBom5/MullltzcUQUWDm3irBrpJ7uAe8kC0CDTCNcJkv85/QnJCmSsF+MdFNggb/qVlv
	 qSQc+/3shmiBzKxwu/gaPpgQo+7k0hB+ZHgampUnzt7s086eVokTreEue45h+mWps5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Js6AusJU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISXlkT0g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE81606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE81606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Js6AusJU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISXlkT0g
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML858153505
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=; b=Js6AusJU1aJqM0Sm
	v85gNtaAorFofzWUIJj7Ha322GvPgEpTIeZVy1T9q4VzD4/LSFGttG0M6DoaGvk6
	0ZHvrN1ExCGzKerskWkckIa2bJKrCw/J57iuco6mbbfZS2DR4xwSQmUJNQwy6ASM
	5dsPklECATLC56/EJd6s2hg+aa7V7DKHOurFeqoV0m3SPrK2H9z6iz0Nu8+7ZyT2
	Co/GBipnC5PRTxKG3gonvMdijBtHI3BZOpJ1K4C5qYn694totCReBFyZ4xZ6Trn1
	EHnvY3KqFjffoFFWFc2vv490UPCKr42SksVLKistVAAVMyMZHmShPQLJt+RQc4cf
	Si6RnQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84bpq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so4536131eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351450; x=1794956250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
        b=ISXlkT0gdxS2LCoEVKNhs2+2BW0QEC6izaSBA9U9+id3U0YbvEauQtYDggoYEpbvDR
         gISrPnbIFNsVsmCd2leoL6Ff8J4SbE7NoRdmlHuwAoUBkxtn+8eN8QXRBWY+FX1WHxss
         4xcD1YafpDWonBqlm7qe9zRIa9opzo0ElI+EEzn9gR5lliT8wpbCgv/kBPpHwl5lAJ/F
         eBMQw33JrCYfJX2D2RDSoEV+rlt5T3LsIwsPdNZySXSbK75OQP2qY9rcbnsovSdCrvuo
         MNSRm1T9o3iUHDQVX2wI/qJY8D8ZBu2J5KGalUW18FJmLvrhcW4UUafnhhePV6sUTQmZ
         Gohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351450; x=1794956250;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
        b=dgHnJqHRTZgZYmJXa38LdxLL9H9KKn99dPm/trVvPb0q1QtYiV0AzlSrZTubT7HUJ4
         O1xudmgE3Mrqx6KRe7gHtvapLQOIh7GJBx9BV4j3vMF23dN9eVHhHMdBV/A0hTYCTIQC
         MqLg+6tmG2cg/O1Teysb3MVcAYP1bcVUvImKzgL0KHkkSckzsnHiSOS62dwApsdOMUUm
         qLOpqs4+m0eXVLXiifj7uutKMsBiGm1OEdAc7ymlVxJ3MjlzX0LBh474zey2Pi0lx4qE
         FOEdXCsUQFC1eeIGjwsDLWZGIbW5urbJaP7zKVHkzZjUUSKKxVdwjTzomnYyUqqjZ3U9
         69Ng==
X-Gm-Message-State: APuU4Z8+/lLx6nKDDeho1Cd6tcLtZAaMpmKjbWr8NsDSMjxpmrskVtZx
	n7lmYiYqDSTAt/PTXJFr31Wbbf9nMTxNsa1Uo0wZ3FjqFMy3yZJBL15ZAUou+QPIHlrc/wP1so5
	QbimmltKPHKrbqhAcrhnZB6vM7TiL0XT1DLlAn1pUkwoNNNi0IYksI/WDltU1jRWXFu4=
X-Gm-Gg: AYBFou38ZyXczYs3yHDZ0cblDrwUL+7f/C96zwvB9Odljba5fRJ4hoR1yFBQnaVAb5T
	/nGaakOp0lSUm3auYB+JEZ3H2w9R6jSzDvWrQkRtZJgcCMy2KzJLVqaBe528dYbV23oNAwJWV33
	sQedtnClQp4Y3FXbamiSt57nbMUGm354qiCqy3Lvk1Wga4lHOrYy3N93X2TPov13yddUtudRW84
	xdkDD+jYVQXQCN6Ux6egfWQvQryvOh/02wY6C8G1aT9I8py2+tqzj5ZBPrzG9Oy1vGmyKVjL2DG
	yJfp5HJw4dZKGQPJyvh3uhfS1fYTtpegLkuuIzIV147ty0h9pn7xJ0Hyc+4YfdddKbonlEj68si
	iAyMoBMmuA1w1nBmfyk7nW/KATmZ5xMSfCVWCOzDAwhmw38QF/d9erq8YPwPVMtolWRY/fojZiL
	wohMvT24WdJU07fVZypGvINhqSedo=
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr1061658eec.5.1794351449595;
        Tue, 10 Nov 2026 14:57:29 -0800 (PST)
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr1061633eec.5.1794351449088;
        Tue, 10 Nov 2026 14:57:29 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm11561398eec.14.2026.11.10.14.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:57:28 -0800 (PST)
Date: Tue, 10 Nov 2026 14:57:11 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 27/35] firmware: arm_scmi: Expose per-instance
 identifier
Message-ID: <20261110145711.00002217@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-28-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-28-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfXwBlcEMfDsN+L
 fdVTrrk+eD/SRcIH+jK79+lMvvNuJzT3AV1DaGts7CBcbU10yCm/Fsbm0jcPRuSPmlzmyiA8hFV
 EbODoEMSCfQ29po3tHeIXdqRLY9cT1KD0r5/3pAYxJftxOHpz6nGkGFi32nKOeQREete33GnowX
 4Gsb/WlMJvfGCvF36JXx6HQ56kSNzrjtEPrBeIMLldAj5xpOwfeHaS21yQ0G56JB5mC+ThZ8fpY
 BPWHJxaqtOzxlem2jkw3Oi+EWBTqu/hkFQNvA/tbV7eeZlf9kjL0ngoCOgxs/PP6wgMFbCsbBVN
 CSt1ujZIkpFo8NJLT1oafO9B6aBCLXcV0ePR+DLaM4u2C3QLmhjYYjg5ulKcklD38fU+a8fLRrp
 HuPO1gJ/sH8z2ARHbDMdtwxeAFxuFcPsnelgJUIMojYLeZj1Opk4mlUEF6Pvxp+cg4fLUgdsEdH
 ISlaqR3jJDzNBDnVzBQ==
X-Proofpoint-GUID: DrKEdlWWLHHLXtGr7nKmG87cIZCLidwk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX+Im3lPbF6MMD
 QpdfBmRCR9N0rXEmQnjwvL36h+ZhkZYTOuXBIpg15gzVEPQicuMcqGfBYT6b7+Cqu7XXovehlOF
 hnMaNVP0JoAtFaAoA5Hc/BEVPekomSo=
X-Proofpoint-ORIG-GUID: DrKEdlWWLHHLXtGr7nKmG87cIZCLidwk
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af3a15a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=P0Bfr-jsjiM-HyT3fQwA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:13 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> When multiple SCMI instances are configured, the SCMI stack probes and
> it is initialized multiple times: one core stack for each defined instance.
> 
> Each istance is simply identified internally with a number and such number
> is already exposed to the user to name the root of the per-instance debugfs
> subtree, if enabled.
> 
> Expose such unique identifier to the SCMI drivers so that they can use
> that same identifier when in need to name their per-instance resources.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
