Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7FA47D47A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963140; cv=none; b=AZM7B6bYH+uI+Zmq2eOi0CL8qESOpQ15TsnAd1nPbNqBwZ0igmSyZo9eXA5T7rTea1zcIRiVgCV7utyS+wiuVGV3ktfzouxzOWyWrROzlHjAS4ZRlZoY8Ez3XvgqCcD4ugKDu2UY9IwcTmGWEkYebHa0cIam25cwlqnkVrlKOPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963140; c=relaxed/simple;
	bh=iYZ4jzh22uG6KvaEvKojNg5qszwvRLO63ZvYsKbifdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XO0mNU3lw0rAB9id0TqtqTUdTRoSCYDiuZuf6ZC9gFBdl/9ZAjlup1n0JSD//FdMGns5EqDiNrLJe2gXDjxmV9kqLt36sOEP6wMJp2Eh0ImekzkYdCTF9rNZ/UZ0HLKzx0b8JvGlfK5TS3F8iBW2yTvZP2WlVlgOR9SL7R3HI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AaptHzDP; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AaptHzDP"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DLTmRE1890530;
	Wed, 14 Oct 2026 07:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=6ssQU9tcZgqqK8UDDocvoF+gguiEeH
	DG3OnM1utzXEA=; b=AaptHzDPk9q3QnurSioZWZHY8WCloILf+kBfn93Nf+lUqS
	kEVbGoqwHHjbR4stEJjwxsA+G3wbcIHJRuHIKIROfXRfyMqpRVUctI0yk/G1mZbo
	u2uK8QR5B9vI6HawKDoC6B8RixyUIlR0QCmNFPy4e3nQxrg0F4dGnnPdHC002iwI
	d6Pf7AR3eifMbsnQrG52R4xVJwjZDkXnbNUVQ1ajfnndboBT5yirK5di2CFZz5zB
	ebNDvnR+BPM2Kp9xVlY1H/lr7I48n0VIgxb9U5j+pNBqpA23KZ9/EWkmKxwSKain
	bF8t0qOoClh6vu2pRnqbVH4As2IYqPAjHwsNNzmw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dv3k1e4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 07:32:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6KdvA3211854;
	Wed, 14 Oct 2026 07:32:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h9q2ykrne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 07:32:04 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69E7W0U739977312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Oct 2026 07:32:00 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4B0D20043;
	Wed, 14 Oct 2026 07:32:00 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6907020040;
	Wed, 14 Oct 2026 07:32:00 +0000 (GMT)
Received: from localhost (unknown [9.43.85.119])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Oct 2026 07:32:00 +0000 (GMT)
Date: Wed, 14 Oct 2026 13:01:59 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Samir Mulani <samir@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pseries/hotplug: Add CPU-to-node mappings for all
 present CPUs
Message-ID: <as8sWxTnsmk9rc3k@li-398ad3cc-28e7-11b2-a85c-e030a5b10d54.ibm.com>
References: <20261012155549.557256-2-srikar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012155549.557256-2-srikar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: N6Rc_U2Z5jtpBdyoOcb6cEbLHRIYmRzY
X-Proofpoint-ORIG-GUID: d0c8A-9cvIwHxq8fNUBl-1hO3kW1ECr7
X-Authority-Analysis: v=2.4 cv=aqInmiZV c=1 sm=1 tr=0 ts=6acf2ff6 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=Bv3w2hTe2OTDbRRUDo0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX+EWBNuCWySJI
 woI/uZLlcZq0YJ3KUY7NHneOJYT42n/pFDM6O5iSMU3Wkhin6uWbJKQybUtmcjWwU6iN1ovHs9u
 bdE9kukABoT37WXmKA5fnwIw/Mi5EmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfXxO43yNKbxHV8
 fI6bWcvVmiMobkqU4aXXWNj1cFvi3O+w6tnEMk6pRcBFlfzv7TjBTNWFa30eefC9X5bUoLFLdhS
 LZEPWebQsuvCpZy8JrwM1K/37KdCd19Y7FSoQefsszsALJVaolVX9rOC1BPQxdVwehLPuy3Qb2d
 KKwAwoKKZ1OOf6fV7msEeZEuQXqdfZZo6sT1qhUL0TnCLyZirmXc5N/vQLj6pTklw9ibWfAOnv9
 v4zB1pfeH+4Y05Ikz5WYxrHFWwxJgt4soqJSGIKoYBcHMna+C0kmD+8jt7DnVkb3fCuknEYQ6uI
 4VVtRphVo7WmpvRzLKTmgFmKO4H8PsNHeLm7t24RTGn7oy0JDXMKIOhatLbBwE3Ww0wpYTmsCdO
 MGNToWejZL/+UlK4vYNsAM94WD+n5XbU3pC3kWYI80a5ZDni8dvakybt6ft7q2zCMVgn4NvC3RZ
 4UH/eaivJB/MERUW3KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140028

On Mon, Oct 12, 2026 at 09:25:49PM +0530, Srikar Dronamraju wrote:
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index bc6926dbf148..b5dc942eec63 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -402,6 +402,7 @@ static int dlpar_online_cpu(struct device_node *dn)
>  			if (get_hard_smp_processor_id(cpu) != thread)
>  				continue;
>  
> +			find_and_update_cpu_nid(cpu);
>  			if (!topology_is_primary_thread(cpu)) {
>  				if (cpu_smt_control != CPU_SMT_ENABLED)
>  					break;

The fix looks correct to me. As an improvement, would limiting only the primary
thread to making the H_HOME_NODE_ASSOCIATIVITY hcall perhaps be quicker?
The primary thread can then update the nid of its sibling threads?

--Nysal
