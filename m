Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4283406834
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428378; cv=none; b=I/CZkaF5LWRPxEaZsqsdp8mtIqXilPqAJY74UfpepaDxzxop2O8d+i4jBIcfBi3+EGweMrcszMXiEUT9TArWl4pUZ6LWv/1Ub/AGSk9Pn+nsu7mtb8wr/qKLzWCqfISBpcnr8MuBrJZBlk57HkjwYdsyMcAGnZ6L0fKEBiXK08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428378; c=relaxed/simple;
	bh=eteUzrmkq8h8GgYq7AnBB8NLtsAMTQF/SAj+F1OBPTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghERwac3Sh6HtPJu71z/7fZTpOVtDoJoMzsES4Fd82/mAgXb16o8xhllXVgucCm5JbmEEPCaRJeaV9s03siBQ2vt0OCrpxX6eJmYOdirfFwSViDvfg/qjtPxpKwZBqB5UqK1GklDDbfZNyiGQrWrfy8kQebAARXgfQNZGOD0DhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=MVLUexj4; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="MVLUexj4"
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EA6374293B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788428373;
	bh=KKkLnet/xNso2VgwykzycKd8FLUzbCAtDdRFW1K53Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=MVLUexj4a4Yi366BJWjeS38modPpPehTrEZOjmy4yF80gLJ8E/QAF/OG7BMmDXBkf
	 dFzRGVKyl56GqAJNx82+QTo6hkHDlfVIJ0pX0wzJeF/XuF2dbeVcnexbxpSARfDBNj
	 TGSOeMLGLAqhLy/gvuNrV/rWfLOaBPNqjf83RSPO4v+7FYuP2xOTMhHPkvMSpwyq/3
	 rQB0eoiReR3+mmwwGA5GWEVN+FGGyHMW8WUsjRzai/5L1kSEyhPx3TRb23WwVOS/jz
	 TZJai1Y7jyhxhT03CVhzTYovm2vWLQv4hGl5K92oZ3LGSw2q+D4d75j60A3ohIXaiA
	 CLP2I85UXeg6Zn50esetwkoQKYVzJSNo7R56DFcae2Gt8CRn9YtPVpLuIOEc9surqX
	 3jnrV97kTHCnopvtW5Z4WiOed86uO31bwm5dgunftvtmaQzZ6BsofjrmApCbSnmoLR
	 5apCp81HeIhg0JMwoj8YuPqZzKEa2+SFwJCGK4efWOybOeiZchyR5CT64+yW/93wDV
	 VXUlNESuZ37OlBNjndwixA6iWOSe4/NsenC2JAcqKvhaWufGEJ113tsxEVwusjMisG
	 jfc66eOG02nsZkUoNFgaADkUjHvOjAHExsWbNc95TevfVAlD63rlbvy+7MU9d9sYHm
	 Y1H3DT3qw/tppkESm7uMMTug=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d292eac1so4492750a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428372; x=1789033172;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KKkLnet/xNso2VgwykzycKd8FLUzbCAtDdRFW1K53Ic=;
        b=n2h+WhPFlgTsD7E6gktUKK0ITKlQmAkxLueaP7vVEuFvkKUL12gtaOpU21mq3gJ0zo
         amok315duu3vFvZ+T/J8lZoizqbSJTsgV4eo2ndDdcv3M7K8XOX+yBUZZGWyzXl8xIYj
         vnsATvC7ZyMTSuCgYaNCIOwXJq2gfZ+tAcqXgHPeOiUorWgUe7aNY4ximlXbZ/NKfM1r
         5eu4umTUgIkhgj98j5y/D3zPxRyw6CgdlgoVxPOQGIFrKeohLtF4y2aGoZrTn2t2cl8O
         Plx4Anw4816sAWNhvk2Nt57o/kvlAjFu08c9ghjHUKT3f75eR8Z8MQy0qexkrA8j0BWV
         fybw==
X-Gm-Message-State: AFuF++lMouzCwvnSEWB4YZv7/o5sIc7vrazkjtc6Ey3/ZxzIkHcSfSVC
	aoyVMkbh1oTLrwe9W2x8XZZQ+Ky3+v+6r6RmWdMshfVv8i/Hy6kYFahOADlN/3DLMTc5Hfk+xdP
	/5sE/a3nGkfz/O9iDOHrD1tnF/Y4jeL94IwpEAJqH4+gj7E48eoc2dSl9DaNh2AfBqYtqsWISKE
	HkdZPArA==
X-Gm-Gg: AYBFou152LbDrKF0bagPMkSfQFoHqiYZSbfmCUPp0KfT3uK1KMLrOh1JAT51GD2mNkk
	akAGA+y3IqJ411rTXdJQOHX0lndcIvcZIFJtA10af5Bp1acsUblJ2jZ+rJgukgryWjSX4wtIKDD
	yXF3IZlQP/S/x73VwaPiMJub7ao87Id4N7zSLpj4gs04dVb/cD812z9unTlQP8L2Rzujtq57J+o
	6sH5PUvwWVpPizOuUcRUI46TbKT7IuNJMz8+Kmw08xUG1z9eQxsdlfMcOdrKwTdAdhwwBCPGgzf
	d4QLNpnCU2OfnObL600aep0uRXuTr807WQCTOjCFTt7g30vFSlHtgJFzNaIzy0jRnZCSmdXdBB+
	c9OaYlo7PKVgsa9k=
X-Received: by 2002:a17:90a:d604:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39aedf5e124mr17481760a91.2.1788428372320;
        Thu, 03 Sep 2026 02:39:32 -0700 (PDT)
X-Received: by 2002:a17:90a:d604:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39aedf5e124mr17481215a91.2.1788428367163;
        Thu, 03 Sep 2026 02:39:27 -0700 (PDT)
Received: from [192.168.192.72] ([50.47.147.90])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm4360801a91.13.2026.09.03.02.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:39:26 -0700 (PDT)
Message-ID: <231fbb7c-0b31-4379-b02a-a79e3b9c28ae@canonical.com>
Date: Thu, 3 Sep 2026 02:39:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] Apparmor: hooks for secctx_to_lsmprop and
 update_lsmprop
To: Casey Schaufler <casey@schaufler-ca.com>, paul@paul-moore.com,
 linux-security-module@vger.kernel.org, pablo@netfilter.org, fw@strlen.de,
 phil@nwl.cc
Cc: linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, jmorris@namei.org, serge@hallyn.com,
 keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
 stephen.smalley.work@gmail.com, selinux@vger.kernel.org
References: <20260902220150.18586-1-casey@schaufler-ca.com>
 <20260902220150.18586-7-casey@schaufler-ca.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260902220150.18586-7-casey@schaufler-ca.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


the code itself looks right
same nit on update_lsmprop as previous two patches.

I know you are working within the insane constraints of the secid, but it really
hurts that apparmor has a local xarray for secids, and now the LSM infra has
one too. I know its a problem to be solved later, I am just griping about the
current state of affairs.


On 9/2/26 15:01, Casey Schaufler wrote:
> Implement these hooks.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>   security/apparmor/include/secid.h |  4 ++++
>   security/apparmor/lsm.c           |  2 ++
>   security/apparmor/secid.c         | 21 +++++++++++++++++++++
>   3 files changed, 27 insertions(+)
> 
> diff --git a/security/apparmor/include/secid.h b/security/apparmor/include/secid.h
> index 6025d3849cf8..ba7adf2fc09e 100644
> --- a/security/apparmor/include/secid.h
> +++ b/security/apparmor/include/secid.h
> @@ -28,6 +28,10 @@ struct aa_label *aa_secid_to_label(u32 secid);
>   int apparmor_secid_to_secctx(u32 secid, struct lsm_context *cp);
>   int apparmor_lsmprop_to_secctx(struct lsm_prop *prop, struct lsm_context *cp);
>   int apparmor_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
> +int apparmor_secctx_to_lsmprop(const char *secdata, u32 seclen,
> +			       struct lsm_prop *prop);
> +void apparmor_update_lsmprop(struct lsm_prop *dest, struct lsm_prop *src,
> +			     int lsmid);
>   void apparmor_release_secctx(struct lsm_context *cp);
>   
>   
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 88d12e89d115..1f304b88eaf9 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1766,6 +1766,8 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
>   	LSM_HOOK_INIT(secid_to_secctx, apparmor_secid_to_secctx),
>   	LSM_HOOK_INIT(lsmprop_to_secctx, apparmor_lsmprop_to_secctx),
>   	LSM_HOOK_INIT(secctx_to_secid, apparmor_secctx_to_secid),
> +	LSM_HOOK_INIT(secctx_to_lsmprop, apparmor_secctx_to_lsmprop),
> +	LSM_HOOK_INIT(update_lsmprop, apparmor_update_lsmprop),
>   	LSM_HOOK_INIT(release_secctx, apparmor_release_secctx),
>   
>   #ifdef CONFIG_IO_URING
> diff --git a/security/apparmor/secid.c b/security/apparmor/secid.c
> index 28caf66b9033..d35fdbf074e0 100644
> --- a/security/apparmor/secid.c
> +++ b/security/apparmor/secid.c
> @@ -106,6 +106,27 @@ int apparmor_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
>   	return 0;
>   }
>   
> +int apparmor_secctx_to_lsmprop(const char *secdata, u32 seclen,
> +			       struct lsm_prop *prop)
> +{
> +	struct aa_label *label;
> +
> +	label = aa_label_strn_parse(&root_ns->unconfined->label, secdata,
> +				    seclen, GFP_KERNEL, false, false);
> +	if (IS_ERR(label))
> +		return PTR_ERR(label);
> +	prop->apparmor.label = label;
> +
> +	return 0;
> +}
> +
> +void apparmor_update_lsmprop(struct lsm_prop *dest, struct lsm_prop *src,
> +			     int lsmid)
> +{
> +	if (lsmid == LSM_ID_APPARMOR || lsmid == LSM_ID_UNDEF)
> +		dest->apparmor.label = src->apparmor.label;
> +}
> +
>   void apparmor_release_secctx(struct lsm_context *cp)
>   {
>   	if (cp->id == LSM_ID_APPARMOR) {

