Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E6228505E;
	Sun, 30 Aug 2026 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076771; cv=none; b=AX6I9vSxSvH7nE3DhKDmKnxptM6b/VLu5QDrLl4fAUMIUAlRKh9c6rL53ZYplhvMZde7YEkEElNYBJJ9okuxm1x9qOypjpwmdODQjKELdDalACy3EZ612cLSBolFHGU3tRnzTQrwkXOrSjJ4ayCZ2QWQQooYmjmyL87AK31IgYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076771; c=relaxed/simple;
	bh=uOxM31bjRV7YLQNHkbTEXKc08ADWGX1tCR+OCV1ZkW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXeEc8oIUoSP3/qgUuTuyaAXdFDQ3L+upBTQzSDJ+CIHHFIv0jpHecQMjLEHRt+X/0ukDdhM1h7lT4pfRotiVcEsesyxQSq55EuNtGcnfIdDva8XsQihKRvG2qJnE3U70xa4i+x++4PO6DCRjotRi4SJJ083h2iR5PaweiujUMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FGdS96ih; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FGdS96ih"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U61gxl1686442;
	Sun, 30 Aug 2026 07:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LabrsQ
	CgpNcQ9QJVLQvjDGWPuBh4k7xgb/r3Q+07xeo=; b=FGdS96ihcuOZI1+HIIwTvY
	RiPuGsB2KfESR+otobHJbV8ZRebdBEzJJuRNRQ750p9UBG/beUwVNljiw1DCvv4V
	nUze2NH0wlWARO0FZUHmrladUNXjsKNi6UxdYFWkeJ6QqDwJzv+H9mFNxfHxvDRt
	TTwzxloZ+DMQBaS9ijmFRSZteOhO8kyXmquf9eEU7qhT+PZmrU5ODT6L+JaXiYr1
	byJEzJksL3rAC6PIwFERYMsXdbt0ns4OtJ2LW3iY9kePqPOFe7yJmzUxd9GmPYhP
	dvNwXIcs1Tjxh5LPmwnaatnwKm3nhj4xthwRp9NeGcoVtoY84e1MsGHDNcp4NWlw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnudbyyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 07:59:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67U7vBvk026298;
	Sun, 30 Aug 2026 07:59:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gca4vruua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 07:59:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67U7x76240108378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Aug 2026 07:59:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AF4F2004D;
	Sun, 30 Aug 2026 07:59:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B5A22004B;
	Sun, 30 Aug 2026 07:59:01 +0000 (GMT)
Received: from [9.67.21.115] (unknown [9.67.21.115])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 30 Aug 2026 07:59:01 +0000 (GMT)
Message-ID: <38e371e9-1f0a-4e9f-a5e1-0b9d696379da@linux.ibm.com>
Date: Sun, 30 Aug 2026 13:28:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
To: Coiby Xu <coiby.xu@gmail.com>, kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>,
        Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Jonathan Corbet
 <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-9-coiby.xu@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260828084900.1496839-9-coiby.xu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: QVLkcSOn0zl5Gmfp9yOozOe0U2KDwsiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA2MiBTYWx0ZWRfX248k4Qtr/JOU
 Z8ngLEqxeiSzD7ptM8zTELZ9MIPUfzCe4YwmBT/GRKvOGFklM+Q+2I3gLmLhsjXbbySiJpto7oq
 ZpQkD9zGqauMWy9UEcYAJ/odOfHK50F3L/FDZo8vHfCqbe6DVaaN24ZJ++o9l6zqfz5cMfCHRTU
 RezUQ3EPuTJpdtPLoLAujjglI1Oh/KQXqD2gtX4tvaBJHQ2fYct9bIvKDp2Fs2T60VF+lWVURPr
 d6sTjyyB1PwbrzW4SpmARAXz6qpvDpjdXijktR+oT29RcBtoxIq/vfjX4c3n/rzrFki4ycpNrKV
 jgHn8zM9qXXuu2FjnJF+nrU9Dh2l06GgVSbqcrOvMsdEA34kBIluIlWmFkneEvHg96M942PYH6h
 xe9J0oAyTNl+Pz9kEky/Z7UmxIUc/MdSOn2RMPR+3pv3VStjra7batAwaMUmPMnYoXMgXbjxBxv
 r9PH7RDlV7inxS/DoIg==
X-Proofpoint-ORIG-GUID: ipw7R-KDWMUjqclakSbqyAlLhCcbf4Z_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA2MiBTYWx0ZWRfX5XgSyEmr1FWd
 0+radNC5UQe01875gDHn+52O9eDBhu0GE1zmYcbwn3NWFDt9jAufFVnlz7hv0bcBdVxc4BHx0YM
 nGILeNK4uqMKvH40298wtnbYAT1yKnE=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a93e2cf cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=8gtcFr281Y2EBf9K9bwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300062



On 28/08/26 14:18, Coiby Xu wrote:
> If crash hotplug is supported, dm-crypt keys saved to reserved memory
> will be taken care of automatically. Thus it doesn't make sense to use
> configfs/crash_dm_crypt_key/reuse. Not reserving
> image->dm_crypt_keys_addr makes it implicitly to disallow using this
> API. Currently x86_64 and ppc64le have implemented crash hotplug
> feature.
>
> Also update the doc accordingly. Note two doc issues are fixed as well.
>
> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>   Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>   kernel/crash_dump_dm_crypt.c              | 13 +++++++++----
>   2 files changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
> index 7587caadbae1..0bf2eb100a05 100644
> --- a/Documentation/admin-guide/kdump/kdump.rst
> +++ b/Documentation/admin-guide/kdump/kdump.rst
> @@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>   
>   1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>       # Add key #1
> -    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
> +    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
> +    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>       # Add key #1's description
> -    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
> +    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>   
>       # how many keys do we have now?
>       cat /sys/kernel/config/crash_dm_crypt_keys/count
> @@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>       cat /sys/kernel/config/crash_dm_crypt_keys/count
>       2
>   
> -    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
> -    # memory
> -    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
> -
>   2. Load the dump-capture kernel
>   
>   3. After the dump-capture kerne get booted, restore the keys to user keyring
>      echo yes > /sys/kernel/crash_dm_crypt_keys/restore
>   
> +For CPU/memory hot-plugging, you can reuse keys already saved to reserved
> +memory before reloading the kdump image,
> +    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
> +
> +Note if crash hotplug is supported, this API is totally unnecessary thus will
> +be disabled automatically.
> +
>   Contact
>   =======
>   
> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index b7629174e4db..3aaa0f9c3117 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -324,7 +324,7 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
>   
>   	r = -EINVAL;
>   	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
> -		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
> +		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory or crash hotplug supported\n");

Nit: the above line is more than 100 characters. There is no
complaint from checkpatch, but I feel we should reduce it to
below 100 characters.

Also, I checked that we don't have pr_fmt defined for this file,
but we do have pr_debug and other pr_* calls. See if defining
pr_fmt helps reduce the character count in the above line.

But the overall idea of handling crash hotplug support with
crash dm-crypt looks good to me. So feel free to add:

Reviewed-by: Sourabh Jain sourabhjain@linux.ibm.com

Thanks,
Sourabh Jain


>   		goto unlock;
>   	}
>   
> @@ -519,9 +519,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>   void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>   {
>   	/*
> -	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
> -	 * keys_header from being cleaned up during unloading when
> -	 * is_dm_key_reused=true
> +	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole kdump
> +	 * image will be reloaded. Prevent keys_header from being cleaned up during
> +	 * unloading when is_dm_key_reused=true
>   	 */
>   	if (!is_dm_key_reused) {
>   		kfree_sensitive(keys_header);
> @@ -532,6 +532,11 @@ void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>   		mutex_unlock(&config_keys_subsys.su_mutex);
>   		mutex_acquired = false;
>   	}
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	if (image->hotplug_support)
> +		image->dm_crypt_keys_addr = 0;
> +#endif
>   }
>   
>   static int __init configfs_dmcrypt_keys_init(void)

