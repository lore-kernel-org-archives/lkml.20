Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943003FFD
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788071472; cv=none; b=C/cx9GSbG5f6Ir1NSCWP8j3R0cCdWCiTu462f6Hk3etx5LDy90aymTmcTsuiuknVY+c51NRaBDBDd6MDAlL4QQN3ugXCNpEY1Ufw05NlxN328VcBjgu6jeHOWtUM89j9SI1We+F6pYbNHD30Q/2LQMcLulpvfYhYhP7ooPtcoo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788071472; c=relaxed/simple;
	bh=3A1IS/s/rig4qgWV5wbkHWsMgalHOr0/M2U/JHJP0zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqmqT4Mt+3qez9LAOMC170EyQhujyoGrZJlE8O0opaLDceDagOcLM+LLlbGhpzhJuIpfvidG9Bi1t6eqN68Cjmjy298TTr4fmO3V/3YHsaZ7mLWhku1PcUf93X3CtjxQY5mNNNK5RHmYk68WtHY1jYJyYQJtbaG9x3z0IfU6rbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=D2GcModK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="D2GcModK"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U61o0C2867758;
	Sun, 30 Aug 2026 06:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pJJ8gF
	C99Bf5MUJBI60nBfbnAAUS8O/nZAwhhB8Yh2Y=; b=D2GcModK7PQYSkjlLGbdwj
	/LoUkmg6sXx9kC4cL+FjZah6vB11z14QwmtWhBuimm6HUSic1VYVnIzhh3eFyKNW
	V8TeN+NkczzPKIpjTvlUeja73W4C+VdmwKdaxAOhOZzft4k9ZdnQaZTNrs/ghDOi
	sDZ+kwxN0bmgVOCJFie8WuS0FbxNlRJ7bOOvp73zGQsi731h0C4xGNlUefoDEhY6
	BTpexwodHnRny6XmqOd5d+ii9yywG5ZE7cM0p+vaR7mRFp2iE8UteztX0dhxRygo
	lgoKD6o6z6alCq6og6jVNJp6H/7/ubd7HeESSdl9NJUq5upi35CWuGVn3g0K5SvQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq2sumxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 06:30:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67U6QSqU000599;
	Sun, 30 Aug 2026 06:30:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gc9rq0rtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 06:30:48 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67U6UkK337487062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Aug 2026 06:30:47 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCA7220043;
	Sun, 30 Aug 2026 06:30:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78AF020040;
	Sun, 30 Aug 2026 06:30:42 +0000 (GMT)
Received: from [9.67.21.115] (unknown [9.67.21.115])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 30 Aug 2026 06:30:42 +0000 (GMT)
Message-ID: <f8994152-7f77-4338-a496-aca67f85ca2a@linux.ibm.com>
Date: Sun, 30 Aug 2026 12:00:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] crash_dump: Fix potential double free and UAF of
 keys_header
To: Coiby Xu <coiby.xu@gmail.com>, kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>,
        Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        open list <linux-kernel@vger.kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-2-coiby.xu@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260828084900.1496839-2-coiby.xu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bc1bluPB c=1 sm=1 tr=0 ts=6a93ce1a cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=i0EeH86SAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=PgKvj6gwfOeylU_sgQsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA0OSBTYWx0ZWRfX5u00X/ApPhsQ
 EWhUvtWdLG61D+1Nj4Q3md6wI1ePrUUc+r5A2C9R+UnzaZ/IuWoCjIBH3lcxZUiOUGIebFxP/ZE
 Qsr1ltViJjFO5lCvR2iwtp5WeN1Cr8U=
X-Proofpoint-ORIG-GUID: E8GLJychtlIBNhIxZ3xiquhew02eFo97
X-Proofpoint-GUID: QPoaZ9JahwrnnYix3CHvqCLmXQ6dQ9fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA0OSBTYWx0ZWRfX+dkIJ193MY4W
 qUNMwvEpxd/oTlp7UdwTmhsVWbkIBlDupyv7V4EU2UXY95JgfF8m4ZIFlMhKE0C4XraiFLfwqLV
 FGhhI+HXn0LIYHxEBLc1PIxaJopZwdRyP4ooDj47L/0SkIp/tZekoWc7Hwf1D9cWcXeNZko96i+
 tpVxn9wuWtlrTkxsI5UBF///CMWbjzltkMKr7p0wJDkdrgJLOtQltHWJXl9Zv4rU/cA3JN/oxFj
 pM5yQX9fPK2X27e00RDERAGenWceViJFd+TxW/Goz6C6etFAOLh5s57MBs+uDWxey/S8Dw6awhX
 FC/+Wax5yA4VN1f1Cy3/Ixi1oZg6X92zn5B8u1ru2vYvomebfFUHWWKF2EZCaJ3AajOC8GTIiMy
 emMWfDmTnujKdNhWMSpLNzPx7h8WaGJlP5usVI46Lo6MiLPJfzygEhwjFe61cvxb0SFdge7VW+s
 YQ384ut9JtKa+GxNWKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300049

Hello Coiby,

On 28/08/26 14:18, Coiby Xu wrote:
> If kexec_add_buffer somehow fails, keys_header will be freed. Depending
> on /sys/kernel/config/crash_dm_crypt_key/reuse, it will lead to the
> following two problems if the kexec_file_load syscall is called again,
>    1. Double free of keys_header if reuse=false
>    2. UAF of keys_header if reuse=true
>
> To address these problems and also make it easier to reason about the
> code, keep two invariants,
>    1. keys_header will always be freed at the end of kexec_file_load
>       syscall except during kdump image unloading for CPU/memory
>       hot-plugging support
>    2. There will always be valid keys_header if reuse=true
>
> Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>   include/linux/kexec.h        |  6 ++++
>   kernel/crash_dump_dm_crypt.c | 66 ++++++++++++++++++++++++++----------
>   kernel/kexec_file.c          |  2 ++
>   3 files changed, 56 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 0af8ae4fdd08..0fa8bac04576 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -552,6 +552,12 @@ void set_kexec_sig_enforced(void);
>   static inline void set_kexec_sig_enforced(void) {}
>   #endif
>   
> +#ifdef CONFIG_CRASH_DM_CRYPT
> +void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image);
> +#else
> +static inline void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image) {}
> +#endif
> +
>   #endif /* !defined(__ASSEBMLY__) */
>   
>   #endif /* LINUX_KEXEC_H */
> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index c685497cd470..4335b6cb1fc4 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -84,18 +84,25 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
>   	return r;
>   }
>   
> -static void get_keys_from_kdump_reserved_memory(void)
> +static int get_keys_from_kdump_reserved_memory(void)
>   {
>   	struct keys_header *keys_header_loaded;
> +	size_t keys_header_size;
>   
> -	arch_kexec_unprotect_crashkres();
> +	keys_header_size = get_keys_header_size(key_count);
> +	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
> +	if (!keys_header)
> +		return -ENOMEM;
>   
> +	arch_kexec_unprotect_crashkres();
>   	keys_header_loaded = kmap_local_page(pfn_to_page(
>   		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
>   
> -	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
> +	memcpy(keys_header, keys_header_loaded, keys_header_size);
>   	kunmap_local(keys_header_loaded);
>   	arch_kexec_protect_crashkres();
> +
> +	return 0;
>   }
>   
>   static int restore_dm_crypt_keys_to_thread_keyring(void)
> @@ -286,17 +293,28 @@ static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
>   static ssize_t config_keys_reuse_store(struct config_item *item,
>   					   const char *page, size_t count)
>   {
> +	bool val;
> +	int r;
> +
>   	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
>   		kexec_dprintk(
>   			"dm-crypt keys haven't be saved to crash-reserved memory\n");
>   		return -EINVAL;
>   	}
>   
> -	if (kstrtobool(page, &is_dm_key_reused))
> +	if (kstrtobool(page, &val) || !val)
>   		return -EINVAL;
>   
> -	if (is_dm_key_reused)
> -		get_keys_from_kdump_reserved_memory();
> +	if (is_dm_key_reused) {
> +		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
> +	} else {
> +		r = get_keys_from_kdump_reserved_memory();
> +		if (r) {
> +			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
> +			return r;
> +		}
> +		is_dm_key_reused = true;
> +	}
>   
>   	return count;
>   }
> @@ -369,9 +387,6 @@ static int build_keys_header(void)
>   	struct config_key *key;
>   	int i, r;
>   
> -	if (keys_header != NULL)
> -		kvfree(keys_header);
> -
>   	keys_header = kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
>   	if (!keys_header)
>   		return -ENOMEM;
> @@ -415,8 +430,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>   		.top_down = false,
>   		.random = true,
>   	};
> -	int r;
> -
> +	int r = 0;
>   
>   	if (key_count <= 0) {
>   		kexec_dprintk("No dm-crypt keys\n");
> @@ -424,14 +438,15 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>   	}
>   
>   	if (!is_dm_key_reused) {
> -		image->dm_crypt_keys_addr = 0;
>   		r = build_keys_header();
> -		if (r) {
> -			pr_err("Failed to build dm-crypt keys header, ret=%d\n", r);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   	}
>   
> +	/*
> +	 * keys_header will be copied to reserver memory later and then be
> +	 * cleaned up at the end of kexec_file_load syscall
> +	 */
>   	kbuf.buffer = keys_header;
>   	kbuf.bufsz = get_keys_header_size(key_count);
>   
> @@ -441,18 +456,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>   	r = kexec_add_buffer(&kbuf);
>   	if (r) {
>   		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
> -		kvfree((void *)kbuf.buffer);
> -		return r;
> +		goto out;
>   	}
> +
>   	image->dm_crypt_keys_addr = kbuf.mem;
>   	image->dm_crypt_keys_sz = kbuf.bufsz;
>   	kexec_dprintk(
>   		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
>   		kbuf.bufsz, kbuf.memsz);
>   
> +out:
> +	is_dm_key_reused = false;
>   	return r;
>   }
>   
> +void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
> +{
> +	/*
> +	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
> +	 * keys_header from being cleaned up during unloading when
> +	 * is_dm_key_reused=true
> +	 */
> +	if (!is_dm_key_reused) {
> +		kfree_sensitive(keys_header);
> +		keys_header = NULL;

The below patch from Jinjie has proposed to free and reset the 
keys_header in
the below patch:

https://lore.kernel.org/all/20260826092541.3905933-8-ruanjinjie@huawei.com/

I suggest to Jinjie to consider dropping his patch and review this one 
instead.

I CCed you on the above patch series so feel free share you thoughts.

- Sourabh Jain

> +	}
> +}
> +
>   static int __init configfs_dmcrypt_keys_init(void)
>   {
>   	int ret;
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 59fb9d71e9d8..062f7e79016d 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -140,6 +140,8 @@ void kimage_file_post_load_cleanup(struct kimage *image)
>   	kfree(image->image_loader_data);
>   	image->image_loader_data = NULL;
>   
> +	kexec_file_post_load_cleanup_dm_crypt(image);
> +
>   	kexec_file_dbg_print = false;
>   }
>   

