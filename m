Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E872931F2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791775913; cv=none; b=KiGUf5rsA5JqtP3QCcDt7ToM47jNtrjUPaGAolSKD9TB/JheRNd2gyZJKQWo2jvQm1a8Y0tY16aqqilfXXf7ZCy0s5NCI0JNVPiN8+FkfkRh0czSH4UVB7dh7hLGsM1PNjCexGeaj+HgEslidA144JR2cVE1V5jqWmlWBNhEAEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791775913; c=relaxed/simple;
	bh=gF1ylN6QeWc9l9FGVcfWxXzrms9qi3TyB4jC+8cKTgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E8FCFscdo3FvAqGkgJnWU1lV4bwezj9yNuhMwCGj2ZGVGYU9IDLhOJGDKkim5WVxgLeyfRL6Dfu2KenyoFXnFQDBfZVrhJoO4nt2YvgCNzfI9j2XzZ2jjhiUgSwMrYVfIvDd/RLRGC4tHxym54Bgj+sNjHRiv2lm50q1a4xm9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ch6j/oKs; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ch6j/oKs"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C2F1rl3157779;
	Mon, 12 Oct 2026 03:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Wggdg+
	YaHkJ81/lkZnYc8fwvnXTE/imHZaTfR9/eH3o=; b=Ch6j/oKs+7d6qMnYNYqLSw
	zqyBE1NItTINQ8vzCyGnAKLQ6jXJsFkRDCFclMzTWIcBp6gLw85itB34XWtZ2hn6
	AP9KQdFFgv4jf8T5IgAKdqdoJLVRxVhfBVvxhNio7G/o/acZanil8gKlnO6tb9Jo
	D22zE2BwJ3E2O2liGutXJ06YE/+broJa9kKafpyqNW/HUDS2LiZXyC5wTfy0KEeh
	qVzxoVtyG8yKF0eM32gwkn2y/4QJgkhapN/jECQP0iVevA+6kmHLqKKBzgeda+jm
	Jf5/vxyAjV4HYnJfFN3B+iHdYX3oWWXb5zO/HCREJnZx+J1IRjM1QIDpcDzGXpwQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dug70m4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 03:31:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69C24nP7563426;
	Mon, 12 Oct 2026 03:31:39 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h802vknrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 03:31:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69C3VZmM48759236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Oct 2026 03:31:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D94120040;
	Mon, 12 Oct 2026 03:31:35 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61E8E2004B;
	Mon, 12 Oct 2026 03:31:32 +0000 (GMT)
Received: from Linuxdev.bl1-in.ibm.com (unknown [9.123.8.83])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Oct 2026 03:31:32 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Srish Srinivasan <ssrish@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, nayna@linux.ibm.com,
        gjoyce@linux.ibm.com, ritesh.list@gmail.com, sshegde@linux.ibm.com,
        linux-kernel@vger.kernel.org, rnsastry@linux.ibm.com,
        Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH 00/12] Refactor and harden PLPKS code
Date: Mon, 12 Oct 2026 09:01:31 +0530
Message-ID: <179177344607.763259.16829250668077101935.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923182816.151451-1-ssrish@linux.ibm.com>
References: <20260923182816.151451-1-ssrish@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Cr0q4X4D c=1 sm=1 tr=0 ts=6acc549c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=YN3Ult6xsG-_URUAlGYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: jtN_yRDh98uchla8znPiqeK5gujvWT1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxMiBTYWx0ZWRfX3B5hcr9W4Oqb
 10P1dbt74sG8TPIlpreU2KujtdWmOE3OPJ5ykQVpxCBIi2y4qMxVrVk6aEuQH5bWkIQZygkFQTo
 6bcbn1jvqTA7XZ7mlnaYijp54y4RdThAsOCR7xYbEz1IqHfSqdFWm5cviZB6NoCAFRqYCRW+/Xg
 UPKZxDYmiM73oq0bZLn70nofYjzNYkuh8PNccs+cYkcKpJw5Rvajnw6qeij8y+T5Ac/hYU4EEdw
 qk++cl57ndrzvQxkI9xwoufjv8kBeowh8TUmIaC9kcsNzhiQcqUCohneku1nfps5dF+0qsTH43i
 eNkX42VfliyNf0yJPtdVYVBRM940tWde35pIyicbyYfdxEHiaesYM33P3E8eqfe7OwUJnQbJrQq
 9kPrJ4T1w+WmVEl6FpWwsE9pKv6CuKnQXJD0wf+eNrvGuWOY3KLn+Pwv9G7I4hlV6rJZMltBn/3
 sJfIWRuGlNt7NRdtsCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxMiBTYWx0ZWRfX0lOAdxhULODH
 VZNTer4AbReqGEuvpEYElwKqK3UQDz3T/5RXD6eVMvrGKuUU7epekdw6mNsVDaBLgnur1NehKZS
 JNSWrK+1aQzeDnQZa8bcgxGxwV37ln4=
X-Proofpoint-ORIG-GUID: gOGT97BrKS5XTFy05EwrvDWH2Zi_p28J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120012

On Wed, 23 Sep 2026 23:58:04 +0530, Srish Srinivasan wrote:
> This series contains fixes, hardening changes, and general cleanup for
> the PLPKS code. It addresses error handling and input validation issues,
> improves the cleanup of sensitive data, and prevents the wrapping_features
> sysfs attribute from being exposed when the key-wrapping interface is not
> supported.
> 
> Srish Srinivasan (12):
>   pseries/plpks: fix error handling in plpks_read_var()
>   pseries/plpks: fix error code for wrapping key reads
>   pseries/plpks: validate input to plpks_signed_update_var()
>   pseries/plpks: clear sensitive PLPKS buffers
>   pseries/plpks: clear sensitive buffers in wrapping operations
>   pseries/plpks: clear signed update authentication buffer
>   pseries/plpks: clear SED key data after use
>   pseries/plpks: fix self-reference in plpks_var initializer
>   pseries/plpks: hide wrapping_features when unsupported
>   pseries/plpks: make narrowing conversions explicit
>   pseries/plpks: rename the default wrapping key macro
>   pseries/plpks: update PKS documentation and MAINTAINERS entry
> 
> [...]

Applied to powerpc/next.

[01/12] pseries/plpks: fix error handling in plpks_read_var()
        https://git.kernel.org/powerpc/c/d52a1659cb1718f93166ab8dd8621237e564a1c4
[02/12] pseries/plpks: fix error code for wrapping key reads
        https://git.kernel.org/powerpc/c/0d0eafedcaf4939819d38ede6ad355ea37acd978
[03/12] pseries/plpks: validate input to plpks_signed_update_var()
        https://git.kernel.org/powerpc/c/b59ff2d50b817eeec1259f357aae821c7834007f
[04/12] pseries/plpks: clear sensitive PLPKS buffers
        https://git.kernel.org/powerpc/c/fe18716ff314eb32299048fd64242d31b4e852cf
[05/12] pseries/plpks: clear sensitive buffers in wrapping operations
        https://git.kernel.org/powerpc/c/203695c109e37d8fe3531844218f75b98eef8e1f
[06/12] pseries/plpks: clear signed update authentication buffer
        https://git.kernel.org/powerpc/c/63de55024e7c85975f4410380323edb05b186d7c
[07/12] pseries/plpks: clear SED key data after use
        https://git.kernel.org/powerpc/c/217ba01e5b9096091acc2c1a3776cb3eb88c00ff
[08/12] pseries/plpks: fix self-reference in plpks_var initializer
        https://git.kernel.org/powerpc/c/abcccecf4aa4b681f50eb7d7de93fc9a0a61c181
[09/12] pseries/plpks: hide wrapping_features when unsupported
        https://git.kernel.org/powerpc/c/46b8411b2ee948b1786bc4af76e7feede0c2ddff
[10/12] pseries/plpks: make narrowing conversions explicit
        https://git.kernel.org/powerpc/c/e0645be900a856a8ec462b1c47a4977ca19808e7
[11/12] pseries/plpks: rename the default wrapping key macro
        https://git.kernel.org/powerpc/c/a2df535d9dd9029987fd9339e5fe668d53a459fa
[12/12] pseries/plpks: update PKS documentation and MAINTAINERS entry
        https://git.kernel.org/powerpc/c/0499ab96527ac4c55be381d7417ff542d4ea24f6

cheers
