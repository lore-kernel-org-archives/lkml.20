Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C044E659
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520275; cv=none; b=GNSZ/Mqjp7pOOUk2SjYb0lUPBL3UEbLOZlVCxu65oLMHhXlVBwhRQ2rYUqAGQOwLdG46rc4573jd18RH5B5oHdCIme5eEJ79MCF+JdBB56QkeoWZzUJ9TgT+2TFzTKI1r1WJJg1//P9C/iLwVV5IJjMuH4Vfg9b804K0p0QWV5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520275; c=relaxed/simple;
	bh=4Aks6RlIMa3TvNWu2Zdbstxl35keZM8OJxbWUDCzC64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im6m8kzEwHuhnAOEIcGUR8KxwR/Ccfy3kjIHLG9SoDChNCRO9s6vT2qGn7otFrwVWiAxikJIq7JtcRJ53kU2mKAfDug9O2tNM7o2uvtsgIa6VL0P5f5eHr448NMDYjdQo8J60pQm0Cwya9VQfwRqRanAfYcp9UVZigkfAy5gQ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=cIh75wow; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="cIh75wow"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AVavJ1535615;
	Fri, 4 Sep 2026 11:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=I4TprDYIq2UGMsJbv4QBY
	z7S0pmsqfYiWCa5hYVpriw=; b=cIh75wowgODEa7ZRX/0FHXgiNidEUHHXLSfyn
	T0OAuFQqEuc7IB35Gt2VCIhuhWgs+6OPD6olhlTpaKiPBZY7x9hvP6ZdwGVtNPiS
	27AipYDQt/+0170IeM7Iz9nwd3nQAbB2f7+eamVYu6qFhJZLktpSWyk9kq0aKkTI
	EWOJRvukaAWZGvpwLTY2takbgSwUCQrTKz/OonVMj6I7d+qKkRopGvxfbDb7W9td
	z299/0SITh4+0kXZXLMsmg7SK9ln+LwzS50r3YzVZFhfNmUF2eyLCzCYlWNinNq0
	w+Y6cLvlNU1GjC5GfcAuUVmHD0T+ODXjf0cn4Gd+3WvQGhbbQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq2tsner-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:10:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 684AuM4P026472;
	Fri, 4 Sep 2026 11:10:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gcceymgth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:10:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 684BAfO236634984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Sep 2026 11:10:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B19682004B;
	Fri,  4 Sep 2026 11:10:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5668420040;
	Fri,  4 Sep 2026 11:10:38 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  4 Sep 2026 11:10:38 +0000 (GMT)
Date: Fri, 4 Sep 2026 16:40:37 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        skiboot@lists.ozlabs.org, arbab@linux.ibm.com, mahesh@linux.ibm.com,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] powerpc/numa: Allow cpu_to_coregroup_id without
 PPC_SPLPAR
Message-ID: <apqnLSv03hsJi_Gl@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20260902123458.340456-5-srikar@linux.ibm.com>
 <20260902123458.340456-7-srikar@linux.ibm.com>
 <f5011bc9-a25d-4f17-92ad-874f9c580dd2@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f5011bc9-a25d-4f17-92ad-874f9c580dd2@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bc1bluPB c=1 sm=1 tr=0 ts=6a9aa737 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=zXQ-6nFpVIVjA7rFoxgA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5OSBTYWx0ZWRfX++cwiXhyErVg
 Wx5lpsLom5qWBvHIlaGhdQxdJJb1Fd3Knn3JWdyQNTeXErdN/xa3aazROcpdlsBIhBqFavA4VAH
 XNoWUHp7WqDa8scsBLHZYefprqcV+UE=
X-Proofpoint-ORIG-GUID: EvuILJZZvhE32KaS1o5ks5eyl-nOOKaU
X-Proofpoint-GUID: HfOpEneuwciwpkpucxaYw4Et8kD1DlNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5OSBTYWx0ZWRfXw+srA6QMAvt9
 9F4fKR7E8TkDTQDKdv8yUjvzFZmSuiyJWiiFvoOTW+J00KvLhfGQ7pjGdbR9fsWoGvQoAELmWxn
 dKLUGypTWFKmNn82e/oIOQGvyHGkNhoFL0TFhVak7vD81WX42I9oRTSOt7rI0uw0Ae4h81UV4R3
 5tD1SwdtS4gVYcBZrms/sgeeZ2a/Prmk1rdinDyu20IFbNazehEPoKkqp6XwQOqXrEzGcrzo3by
 gM7e5G/fhsWLONULv9dNuazysWZwKSmuNeI7e2Zx0ZI6hymSXDbciHiXrGtDwZS9Da/Qc6eaV26
 thdaiHoPGQMAv3qoByM9cv1dy8EUUDYKlF/N8wCLqDZxgUR4DV7XkkXpfxLil8waLW3Hedw8pcM
 yFsF4PjU8tQ7hGTi9xqwHbYo3uRtP/4nOKkIQHOhepNT3xxgzk73tfHylp7gIb3h42EefnknSBv
 aBYKFhTJrxxNzjmHSNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040099

* Shrikanth Hegde <sshegde@linux.ibm.com> [2026-09-04 15:29:03]:

> 
> 
> On 9/2/26 6:05 PM, Srikar Dronamraju wrote:
> > Make cpu_to_coregroup_id() available outside PPC_SPLPAR so it can be
> > used by platforms that do not rely on the SPLPAR-specific VPHN path.
> > 
> > 
> > diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> > index 44ec416fa489..02c3c9ab3ea9 100644
> > --- a/arch/powerpc/include/asm/topology.h
> > +++ b/arch/powerpc/include/asm/topology.h
> > @@ -71,6 +71,7 @@ extern void map_cpu_to_node(int cpu, int node);
> >   extern void unmap_cpu_from_node(unsigned long cpu);
> >   #endif /* CONFIG_HOTPLUG_CPU */
> > +int cpu_to_coregroup_id(int cpu);
> 
> nit:
> 
> I prefer extern before declaration so that i can see it is defined
> elsewhere.

Hey Shrikanth,

Thanks for taking a look.

It was done on intention based on comment from Christophe Leroy here
https://lkml.kernel.org/r/6387fb12-76f1-4503-8ac2-3ca777c0186e@kernel.org

> 
> Other than that, rest looks good to me.
> 
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> 

-- 
Thanks and Regards
Srikar Dronamraju
