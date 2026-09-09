Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468063A873C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934796; cv=none; b=HI645aQY9Z8owt3VMKu9N+7Y1QkP5O3nLzoCyelLLdOpzQf418CuFqTk5Acz4pfceKTedfYsWV0txh0uUuHZgGvLIDcjL0ljGuavFntyAet6eVPoL6yB9NMrWAmrfOD9km68Ttcr4h1AWPuOOgxgpPg1s54TueCyBmHaPio1UDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934796; c=relaxed/simple;
	bh=Rcwr1s2uZjKVskOETt54T3QIs6zih/0lWt1YfuQ/P0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HiTU6qP5kLPR6rl8L2K6485A0B4bUaI2O8YMoWQMoJqLerDv8SX8j/hwfkcm2RpgkARIcv8RCq0iUDcy+wCvxJjcOVZa7B62nEgYOqAlH9orbBQw+I1l0QGjowN4tddasf8RnGeJu1n9hBysEmwIAM/KmSNEXrbtWyoMANHlKDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YRhcY7lR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YRhcY7lR"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688N1aqp1116393;
	Wed, 9 Sep 2026 06:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=umSG5z
	kQo9n8ak7oNcq8X7rJyP5FwV1uIQNFDgN3tVg=; b=YRhcY7lRMo0bEScJk/vj78
	ACiXGN63l+xJBYlhsb3mmTsPl+kVQasSOX4qknJmze2sXqzDJ3FVS4vorDMV8mDG
	KgX/svP+4OT29lXeTS5d3FcTivZuKiBax+j+j7aX2WHb/BHp0G/Y/RUNXgMwKSgg
	4FosQEWQAyuuv3fmwRkT5Y6YUpmjhk8cCB7YwCzMdMw1rOvdnnZsqzQjKnUaIX6+
	pJzTU0Lqg6/u3g5gK1ndF4Tsckq+bQfFnEo2Xdk41CIsHzXznJsiiPP6kAHV3lCg
	T5/bJ2fZLj2MpJpLQFLiTglOvsaGJn+9ky5LcRTxJJ923U7Xp4kXX3sE0/0/WAOw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbjruqcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:19:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6896BMxe008904;
	Wed, 9 Sep 2026 06:19:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ggymggfwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:19:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6896JGxB12321220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 06:19:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 735CE2004B;
	Wed,  9 Sep 2026 06:19:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C762E20040;
	Wed,  9 Sep 2026 06:19:12 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.64.17])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 06:19:12 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        nayna@linux.ibm.com, gcwilson@linux.ibm.com, kees@kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        13667453960@163.com
Subject: Re: [PATCH v2] powerpc/pseries/pci: Fix misleading VF limit error message
Date: Wed,  9 Sep 2026 11:49:11 +0530
Message-ID: <178893459272.174069.11231777088972821976.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813063731.399598-1-yijiangshan@kylinos.cn>
References: <20260813063731.399598-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E7T9Y6dl c=1 sm=1 tr=0 ts=6aa0fa69 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=tdvlz4ZTpqE6WLztEXcA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX8DznUlwjG4Li
 qG+4RK0fx8wPsuHJPgCxP7+F9APlSUfQCq6B3UPRlJDANOjYiBCFdBEXQyZtgVvr0wqUC+HiUMb
 dF+Qku/5Xs/QAAC05oq4mJYY95gIG+Y=
X-Proofpoint-ORIG-GUID: v126GnCJKoZU13sEZAauUgimU6MIyq_w
X-Proofpoint-GUID: KtG5DEIHQ2TQQkLjpDfcReegHPznyS8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX99J1kYga5iNf
 IK9AtsUspAxDZ0FDGfGokSUz65xXO5mz1gI6+fAE+EF5/hr7/83wbNqSuOXObtj2F0/DC+eTOQG
 +BFHqWiFWeXfVXMVZ2dsyRzfne5CSgUnxL2lMGYEf/95oDt4ACk6HpMI7cOl+JDcsc1qXCjbK6v
 Pl0LuaMU3R8vxOUmJX4BtJDjxM4/cHwvjDDpcqzLLMt/FNPpz5UhghA3gc1zPD/Fy+VkNqAgLHt
 ySyeztwLffo4upA0l6dpmIejCq/Oa+1fdUKB4yTc0R4/GW+wN7Lh3sP00/zKRTF8xL9NcQzjkTB
 7FRbzr+E9ryefwETHfz7K+ro1qWZXVPHUufK/L9NtIGvwt3FiVp+L3epO8gp9EXpC7uoy+kXgzz
 gLI+zyJSxooUNM3FS43eI1Hc2mxtycKEY8Qyqp3qJtja7PAtxayeaILoIb9LVY+5p/Ly5HIvhwF
 G2RoH0+THNu9xxcvVEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

On Thu, 13 Aug 2026 14:37:31 +0800, Jiangshan Yi wrote:
> When the number of requested VFs exceeds MAX_VFS_FOR_MAP_PE, the
> message prints that limit but labels it "Configurable VFs". Report
> the configurable VF limit and the PE mapping limit with separate
> error messages.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/pseries/pci: Fix misleading VF limit error message
      https://git.kernel.org/powerpc/c/b1824233b19c1dffdb5e81283805a9e52e763caa

cheers
