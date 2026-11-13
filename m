Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606848;
	b=tnXApQ/WkvywV75tPZmunElYFb4hIOsD/1B0tQqXP34dTmp7OnWTFD+dtBcQbU93HL7V
	 ZSRu6QOf8zMRk5SbzcMzgppmcPOvE4PPbct56aggZDHVSujjz+XsgWJt0lXvuSx8M+8ws
	 NJNe012ZKvuu+VQwBeYk49F4OUXle1KdZq5jPdWucQeaPQTV7XrwBnnMpCoR6V8THkmgX
	 Q17InQuCXVwlAorzSLkPBk463TXTbmR6OlIjykhNvzdkvne3q3F2u+uqB7ZnU6KizxfLf
	 l2IEPomqzB/HdIKf4Kn277Mmlpfvgp2DKfEh+Ewfao88u6D/zxt3BWDShTKx8Xt1Lkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606848;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1CcqFIpasLROjJEwz7TlT9+SP6PGVEwxfn522ZtvnGA=;
	b=xAc/4Vsw0MFUC4cSgfqf2qX22E3GQW5t8irG2DmUM1xZqWhkUzcqSRbDCC/FuzqcAPkf
	 X7ZWj+mEg97vUO/8/AmVwV8nY6NtuiMS6Ax/yUtjfv1zxT7ImwjRR4Xl+9+TCQaNbxw0y
	 VmJQrn904DRl33zdmqqlJWNDw4lYAWqWPI/n3j8dtIyqBb2iKeJVA90XVvtFlSbAxCmtZ
	 B25oja7VPQIj3HMGnAdS7Kx9jXXkfGmINxKkoED1sonWukPWpy4e5lmYsxaG2dv7h/aSZ
	 B/dEACNjOPA7IfAY9dzah40+JdpYMUEvC3RxPESLlQPr1EagTVPrLmsUFvJ/1ipEK4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m9sO5C1e;
	arc=none smtp.remote-ip=95.215.58.114
Received: from mta1.migadu.com (out-114.mta1.migadu.com [95.215.58.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221D606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1221D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m9sO5C1e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WDMz8JwS9iO4OEO63+zyUH6bkhQYGGRugg2OY55yg+8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794606845; v=1; x=1795211645;
 b=m9sO5C1eUNNjLfIKQ526P0boL1mDYLXzDzG4HVH3iSoNoWDhxt1wZxN1/uVtsIc3514Jr3tq
 H8hfG3vVnIFlpsosfweQvGiSv/rmnmxNE6YvC58niotvloUp6LDHtKlom/DINRdV3VjPo1YNYjw
 /5jEY3I1rgjVYh5zkiy72OJ8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a174c48929158967;
	Fri, 13 Nov 2026 21:54:05 +0000
X-Mizu-Trace-ID: a174c48929158967
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 21:54:04 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: "Serge E. Hallyn" <serge@hallyn.com>
CC: Christian Brauner <brauner@kernel.org>,
 =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_userns=3A_security=3A_Inform_LSMs_?=
 =?US-ASCII?Q?of_capability_check_during_userns_creation?=
In-Reply-To: <aveDlb6PlPSVoLD9@hallyn.com>
References: <20261111205814.3282968-1-bradley.morgan@linux.dev> <aveDlb6PlPSVoLD9@hallyn.com>
Message-ID: <4A0D804A-1199-4402-91EE-E37E8D6EA9E7@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 13 November 2026 21:39:33 GMT, "Serge E. Hallyn" <serge@hallyn.com>
wrote:
>On Wed, Nov 11, 2026 at 08:58:14PM +0000, Bradley Morgan wrote:
>> Right now security_capable() gets called in create_user_ns() to snapshot
>> whether the parent could setfcap, but the LSM gets zero context on where
>> the check actually came from. It is the same story as setid: without a
>> dedicated flag, security modules cannot tell this apart from regular
>> capability checks.
>> 
>> Add CAP_OPT_USERNS_CREATE and pass it along from create_user_ns().
>
>This should be patch 1/N in a set that introduces a user of it
>in some lsm.

hmm. Did you read Christians suggestion? Let's see if Christian or anyone
else could suggest a nice little lsm user for this.

If nobody responds, in coming days, I'll go and find and do a user for it.

>
>> Suggested-by: Christian Brauner <brauner@kernel.org>
>> Link:
>https://lore.kernel.org/all/20261111-kommt-gischt-ohnedies-469998d2f219@brauner/
>> Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
>> ---
>> Thanks Christian for the suggestion :).
>> ---
>>  include/linux/security.h | 2 ++
>>  kernel/user_namespace.c  | 3 ++-
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/security.h b/include/linux/security.h
>> index 40831fab54709..d24666a0b4833 100644
>> --- a/include/linux/security.h
>> +++ b/include/linux/security.h
>> @@ -75,6 +75,8 @@ struct nsset;
>>  #define CAP_OPT_NOAUDIT BIT(1)
>>  /* If capable is being called by a setid function */
>>  #define CAP_OPT_INSETID BIT(2)
>> +/* Is capable being called from the user namespace creation path? */
>> +#define CAP_OPT_USERNS_CREATE BIT(3)
>>  
>>  /* LSM Agnostic defines for security_sb_set_mnt_opts() flags */
>>  #define SECURITY_LSM_NATIVE_LABELS	1
>> diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
>> index 57b7f10be74e1..37480f6d8369f 100644
>> --- a/kernel/user_namespace.c
>> +++ b/kernel/user_namespace.c
>> @@ -134,7 +134,8 @@ int create_user_ns(struct cred *new)
>>  	 * audit: the creator may never map uid 0.
>>  	 */
>>  	ns->parent_could_setfcap =
>> -		!security_capable(new, parent_ns, CAP_SETFCAP, CAP_OPT_NOAUDIT);
>> +		!security_capable(new, parent_ns, CAP_SETFCAP,
>> +				  CAP_OPT_NOAUDIT | CAP_OPT_USERNS_CREATE);
>>  
>>  	ret = ns_common_init(ns);
>>  	if (ret)
>> -- 
>> 2.53.0
>

--- Thanks!
