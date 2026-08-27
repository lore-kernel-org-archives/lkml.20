Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E30E34F49F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830735; cv=none; b=Zc4GW0snzGz6mdHbdemzcO77sjQKMmXiO3WHh+osSi57Uod8LrN/DGOnCVY6F8OuJ1d/5sdxylPb0ZJfdgsP3do96QIloSVkV3aJHK4mjz4co3EtToRDAs4tL8X90NgvsP5yiHaErNNlsEv5zQurapuOXK/irdnTjUKFgCzhLEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830735; c=relaxed/simple;
	bh=el7P/Mdm9a6FZB8ox4xc/2lV5RWOgnh01y/WsUBGitw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0eYq0mlYHEYemhdb9ISDmWhNzZO8pLyZKqZm5yQgsmBvxMpZ+ZOyWaoaaFWS9JVUL+n+OboiZwK/UMfvkI24ykfj9F8sWkPkcKELck4EGWFZBfAA/pi00V7lN2e+XfXvQwzDTmkWeeDEyB/kY0jSEMtCv0RiLV4SbTpiJA1dik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=faS261Q1; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="faS261Q1"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9VVU22581880;
	Thu, 27 Aug 2026 11:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JOJR1d
	EASHzxHZj+6oDP4u5XYnz7HCY5rmJTSbFiOgA=; b=faS261Q1lcTrz33qQ14aA1
	XvUiCXG+kmmFyiY7HSfGpXfTwe0gzdWKoB5z5mwOLYs0nFWQCK0NNKy8DpLBxb0w
	RtoDwLSsakpdDZHYorOaWK11blcAz+8gXME50hXWB+UVpz1EFtZFtX+IFq0BjiZW
	xvXPCzt+b/ypwXTodVuMlS/Z8BhH+LzbIa72hgrRUSkTFo342F6pekpqqjbfKOoz
	K78173TOvl6+QvMvVLlQyV0ocpfWxEcyL5l7pTPA7Lrv6sKGFiHf+wcvCSXPzdwH
	70LDditpwIipWmBlP7FA8We4dIFTdrFFZN9e5/VSvQ4HqXQ+MPBnBv1JazuKxcWw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4g7394d2ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 11:38:43 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67RBQOt9010891;
	Thu, 27 Aug 2026 11:38:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4g7pfwfvfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 11:38:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67RBcZ4E41025810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Aug 2026 11:38:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8CCB20040;
	Thu, 27 Aug 2026 11:38:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 497F32004E;
	Thu, 27 Aug 2026 11:38:32 +0000 (GMT)
Received: from [9.39.21.111] (unknown [9.39.21.111])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Aug 2026 11:38:31 +0000 (GMT)
Message-ID: <a147c153-0c73-422c-a183-dad5c5b9aa5c@linux.ibm.com>
Date: Thu, 27 Aug 2026 17:08:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc: userspace processes crash on abort() from libc.so.6
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, maddy@linux.ibm.com,
        christophe.leroy@csgroup.eu, riteshh@linux.ibm.com
References: <e301014d-568f-4ed5-bc64-b8a85ca0b1e1@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <e301014d-568f-4ed5-bc64-b8a85ca0b1e1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UyLBrmhSsgjsiKkj1IdvrlYbjGq-MIWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfXwF7a8D2C1emA
 KtAsLiapJz9YsWw+2M72hSE8QVLLkdas2bjulNliRHjVL+l+tDJJ5MRrPtBHLxip48GrVjoR+PL
 bamN/j5bOqeHoA38m4Hq69Wd1VM+2/EgCQ3Uny3imEgYLgKseM3JgFAMvNLluLvf7LyUhFV5ZHZ
 RgtIh7AULaPn4B7OyX+Xd/b3QsXeP2vSZdK6AgxnzOUfi3sqCjaspwrWb6DGn0OrMAjTXoZ1gmQ
 S8rwq482gP+E+LuGJJSMQvFCLf6gul+IVvlxKlvMequvPDmxvwdjkjqNWnZC5SF2MIF6VdF+wuw
 W6BY1Ovs7nxu0ASAKntHXOVGnt7sVV+NzhqBSznSeiBdJGI/JZpf7Nb1TpC2c1v1KiuaTz8gfCz
 td+7wcCwvi4ggdqzIB7VvQV/YYHiga108V+XdV5qHKKaoXZXdGIOPaNCxoEX7N2n7wBbw+J2pku
 nwOcYY52Kep2wzDZlBA==
X-Authority-Analysis: v=2.4 cv=Y/nIdBeN c=1 sm=1 tr=0 ts=6a9021c3 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=dz-O3gLL9ZW_plmJqncA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfXwMPuG7lrZ6US
 GaryvuelSVHgKG6bGyWs3QlxD4D7F8hoV/49pjqAsbHt+EaUCa3AWHDfiz4qHR4ev6hC214wi/F
 j8iwEjdeuHHM+/RIsYk1NQlPvqOjp9E=
X-Proofpoint-ORIG-GUID: UyLBrmhSsgjsiKkj1IdvrlYbjGq-MIWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270096

Hi Shivaprasad.

On 8/27/26 11:13 AM, Shivaprasad G Bhat wrote:
> 
> Hi All, Thomas,
> 
> On my PPC64 machine, I see the below systemd crash orginating from abort() during boot on top of the tree. Complete dmesg can be seen here [1]
>        abort (libc.so.6 + 0x29484)
>        __libc_message_impl (libc.so.6 + 0x9e00c)
>        __libc_fatal (libc.so.6 + 0x9e06c)
>        start_thread (libc.so.6 + 0xadffc)
>        __clone (libc.so.6 + 0x152d68)
>        __clone (libc.so.6 + 0x152d68)
>        create_thread.constprop.0 (libc.so.6 + 0xad9c8)
> 
> The git bisect pointed me to commit 3424d8c18a7da "(Merge tag 'core-entry-2026-08-17' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)"
> 
> Please find the kernel config used to build the kernel at [2].
> 
> I have tried applying the pending fixes from Mukesh [3] and Ritesh [4] for the currently outstanding issues and still see the problem.
> 
> The system is running Fedora 42, with glibc-2.41-7.fc42.ppc64le. The
> complete list of toolchain and packages can be found here [5]
> 
> Thanks and Regards,
> Shivaprasad
> 
> References:
> 1 - https://gist.github.com/shivaprasadbhat/6f166374bab12b4f4c1cd4ac829e562c
> 2 - https://gist.github.com/shivaprasadbhat/aa499468e124015eec5932fb13e88e05
> 3 - https://lore.kernel.org/linuxppc-dev/lda1jyut.ritesh.list@gmail.com/#t
> 4 - https://lore.kernel.org/linuxppc-dev/20260820134718.2176411-1-mkchauras@gmail.com/
> 5 - https://gist.github.com/shivaprasadbhat/ae56ca849c3009e8642a6313dc465ea7
> 
> =========
> Backtrace from dmesg:
> [   22.039343][ T1833] systemd-coredump[1833]: Module libsystemd-shared-257.6-1.fc42.so from rpm systemd-257.6-1.fc42.ppc64le
> [   22.039378][ T1833] systemd-coredump[1833]: Stack trace of thread 1828:
> [   22.039378][ T1833] systemd-coredump[1833]: Stack trace of thread 1828:
> [   22.039401][ T1833] systemd-coredump[1833]: #0  0x00007fffa4c29484 abort (libc.so.6 + 0x29484)
> [   22.039401][ T1833] systemd-coredump[1833]: #0  0x00007fffa4c29484 abort (libc.so.6 + 0x29484)
> [   22.039429][ T1833] systemd-coredump[1833]: #1  0x00007fffa4c9e00c __libc_message_impl (libc.so.6 + 0x9e00c)
> [   22.039429][ T1833] systemd-coredump[1833]: #1  0x00007fffa4c9e00c __libc_message_impl (libc.so.6 + 0x9e00c)
> [   22.039461][ T1833] systemd-coredump[1833]: #2  0x00007fffa4c9e06c __libc_fatal (libc.so.6 + 0x9e06c)
> [   22.039461][ T1833] systemd-coredump[1833]: #2  0x00007fffa4c9e06c __libc_fatal (libc.so.6 + 0x9e06c)
> [   22.039491][ T1833] systemd-coredump[1833]: #3  0x00007fffa4cadffc start_thread (libc.so.6 + 0xadffc)
> [   22.039491][ T1833] systemd-coredump[1833]: #3  0x00007fffa4cadffc start_thread (libc.so.6 + 0xadffc)
> [   22.039521][ T1833] systemd-coredump[1833]: #4  0x00007fffa4d52d68 __clone (libc.so.6 + 0x152d68)
> [   22.039521][ T1833] systemd-coredump[1833]: #4  0x00007fffa4d52d68 __clone (libc.so.6 + 0x152d68)
> [   22.039551][ T1833] systemd-coredump[1833]: #5  0x00007fffa4d52d68 __clone (libc.so.6 + 0x152d68)
> [   22.039551][ T1833] systemd-coredump[1833]: #5  0x00007fffa4d52d68 __clone (libc.so.6 + 0x152d68)
> [   22.039580][ T1833] systemd-coredump[1833]: #6  0x00007fffa4cad9c8 create_thread.constprop.0 (libc.so.6 + 0xad9c8)
> [   22.039580][ T1833] systemd-coredump[1833]: #6  0x00007fffa4cad9c8 create_thread.constprop.0 (libc.so.6 + 0xad9c8)
> [   22.039614][ T1833] systemd-coredump[1833]: #7  0x00000000003af858 n/a (n/a + 0x0)
> [   22.039614][ T1833] systemd-coredump[1833]: #7  0x00000000003af858 n/a (n/a + 0x0)
> [   22.039639][ T1833] systemd-coredump[1833]: ELF object binary architecture: PowerPC64
> [   22.039639][ T1833] systemd-coredump[1833]: ELF object binary architecture: PowerPC64
> [   22.042109][    T1] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.

I was looking at merge patch and It is possible that TIF_SYSCALL_RET is still set when it is returned
and maybe causing a mismatch.

Does below help?
---

--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -19,8 +19,10 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
  	long ret;
  	syscall_fn f;
  
-	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0)))
+	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))) {
+		clear_thread_flag(TIF_SYSCALL_RET);
  		return syscall_get_error(current, regs);
+	}
  
  	if (unlikely(test_and_clear_thread_flag(TIF_SYSCALL_RET)))
  		return syscall_get_error(current, regs);
