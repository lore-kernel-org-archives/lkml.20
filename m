Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95D753A897
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076402; cv=pass; b=arhHrU9N3bZmq+hUDh3S4RI/fWQhg1MdhpDxBvQ2TCbNAyyvf9FX5dzb+aCTMUMqqp3l7HCL9r9EgI5gcbTnDjzF/bwnNOaAUCeI6UBNSrlMsQ7tD90Hp2DFf4mQogOuWMoqBWxREuhV4ZG3HcxitxoffSLitH7orp/cUwHxLDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076402; c=relaxed/simple;
	bh=EnAulzdwZZUNacsSO5JAqAI8aWy+2MWOn3g0jZUFmBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxmYzLjr+bX+QUeqe77Q2pNKbjEF2TNlKSArDkRy/ERXj8K3re/Cf0EMx2Ejs8t8cg78zpzIzw3SDMqV6491ZbpLd3CBDW7W3sh5okOE28uL6ZReT8pAeZ9ZyxmehDJw/6hDhCHGn+J/IdtHVTRDXtWdugVr7UaUWtIznPsQVhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B+5y2OUP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tmxAKG7y; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B+5y2OUP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tmxAKG7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790076395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiSOuYwJYI5AO9B2WqiuxGZ3NuSU54y3F1+XGq/C0HE=;
	b=B+5y2OUPMaZHs+l0bF2o7XAYQDNbyxguE5DN7JcBWnjWWOWuwM/kK5ijSfYk9WVIbsVSKP
	rF84DI/UqTf8jpd7svmOypm+pEbVVn3Ko1gtslY0aFFFqU8AGBKwGD9s6mG2J9P/iPOUWz
	mrH6QE+IUHAzG8czPdbv/bCIaq25gjo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-6dMXzaVYPkWcakTUwRloXA-1; Tue, 22 Sep 2026 07:26:33 -0400
X-MC-Unique: 6dMXzaVYPkWcakTUwRloXA-1
X-Mimecast-MFC-AGG-ID: 6dMXzaVYPkWcakTUwRloXA_1790076392
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c294ae16988so493026266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790076392; cv=none;
        d=google.com; s=arc-20260327;
        b=GOKTbaF9X9VSRKYli6ZFSzn9Uf7n8ghlY2xEQ9brHYbrIy4Jg2cZVXUsWDDq6FfCOP
         axIMzGuy81lz8mqx4h5n33iZMw5JLxQo5aq0GwPIiml+rWE2ctsvOFybrZvRib9Tqs8g
         lqFnfnoU9eVvUUfi6FHDjy3N133U+lua7pXsndR7A3vEEEHkNzNKzOnIQDvuP+DZqbEZ
         gKH9RycDrrM2c91IfdlQ1NKZlk5WdIs3CZTPiUQ+tYPonFRsOgyTzqgUbih5zXicUmAk
         2KavnabyLo1tddciCmloaMj4Q3xrQdkwNaqDkAiAgbquT+Ho5UlZJH/VJptOxsHn36FV
         Ji/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wiSOuYwJYI5AO9B2WqiuxGZ3NuSU54y3F1+XGq/C0HE=;
        fh=onQxNkusP7PHF/P/w6GIeeKsaKUG7aBGBZydnM4jysA=;
        b=e7nDTfwrulcMxqGW4FwZzGVTu8npYGJ2NB7rs5rtAd0LfIlBiz0Fm7SUVCJQxPMy5E
         W7NQmGizmhEC21l4BEsSBQPIirxG9QFvQWiX4U45iQ9yhz1HxwjJCBTHOahp+HBWBq/N
         7kFqx//MlgHQzw7D78QB+9qShv5KKxV2yUH1aV7++JEQ1ELZH9afe5Y+NpUx9t5CyjzZ
         A3antA8QaasHw4lKUxoAdBnZXPNgxtvDq53GIgAp/nILCFRsgGzcXHlbuVRdqbazEbiB
         b00X9FPWG+8i73qNwj4Xc1o9vBEIuKMfp2nxL3ZEKPw2NIl4jwmgVGv6AafKBZYMVeoZ
         p1xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790076392; x=1790681192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wiSOuYwJYI5AO9B2WqiuxGZ3NuSU54y3F1+XGq/C0HE=;
        b=tmxAKG7ye0v0o+b36tHTKc2sllHwvmRTMnyunJ2yxT7xI2atcEuui/BhneIQoUnFbl
         uMzmFf6FOeq0tzULjPuo4AQ6LFCrb8Oa4iyjpPdReb1NO1BnKMiFj9uZJajNASdKYell
         5vWZ5MB4vliVdgCsFbCnwSI/4PDN1nK0rbeRk/p5yuOXQUp5HJa2TA1fzI22YfpGXlCL
         OAyQNvjbMjE4QgU1MguJXucvi5iieGIh5EVCLFyGsbYJaAVP24QKpdNQ5G8hg9RD9aTp
         y7ukaWNC0LCwTPk+eZRz0r+ikElmgDpMNXRke0ctzHudvty7HUi1mtAKULNJYNm36GQV
         +sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076392; x=1790681192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wiSOuYwJYI5AO9B2WqiuxGZ3NuSU54y3F1+XGq/C0HE=;
        b=WXKXhcpxgsr91Rn7z/+MQnpq+n2Rt4M7RjVAMEeiVH13YS2VHg7aHApAuzfi+G/5tP
         UyY7MWKoKC6QbxNk8DL34XIiGthQD0/GKiWtK/Y3kX0tagvIBprkPH8cBcdbMSWIoM6W
         E9P+qIrEc8ZMQD44lzjbcQY2CzH20SAR/1OKu3A7F+zbzVyCfor7dxWBBXuElW0AeBRY
         x/MtanewcLlDRMZ8SiSazSn3MhKBLL3yyR4L4XvMkgG+Gd3dePM4TKOO7GXcerwes+D1
         m5HD288MiS86+hgfuAch563BR4bRZQ2/AKROnWQRZmaNWCbHvGpTwc9oLD0nnogz2lAG
         I9bA==
X-Forwarded-Encrypted: i=1; AKwUvBzBD14ZrAnrG49bkvM1ZXcsrqQDa402bpuH/bjDCVwPKBYlQqkA3f9bUf2ZBM5xB3LLewIURU5ujMw3z1s=@vger.kernel.org
X-Gm-Message-State: AFuF++k5AL6WkZaomwn11158kkXhXppz5Yx28eSMtlzC4AMvm4Om/Q0y
	1SVLRuGz80LmK2cC4afjSXrkPV6s6kI3aYjh+O0STNddDiT3qCGwoqFO0RLLtZIVLhRCrk0/Apc
	dgS953YMYvX1zgy2sxKVYY0QbE9i5Q/2SIUBUY84NZIHu2ULu3a76YextKecyBHqTQ4W2NS6CN1
	R8vq/pl9I82WPeZHh7xYaYQhU3/fPckAtUZT9e2ZFj
X-Gm-Gg: AYBFou2WyZhO7IGn1RznTcIqBgGMzbDFIZcG6zZSU1M8nXDA0G0dfFiP8QYN3LRkKaz
	vnRdUO0kLg5O7Lxyo2pVu29/r3ZGJCnMO9JPVYcJkOanrQsgmopgXyGxqzGuu1NN9ln4o0NX5sg
	Lm9Ofw/QFSi6UuBD06jBusunpVw2m9zuRW54YceQF9rQPU4myGHXwkHDIXtZq/XdMHXmjfNiAjo
	XpnGKjNEFHeeVRurlyCKaq8ehiq/G1BPzp5pFpJ9eB/1QpCsZy6G1SBBIDY206pvm3U1d9T0QVA
	adU=
X-Received: by 2002:a17:906:ba89:b0:c29:5151:16b8 with SMTP id a640c23a62f3a-c2a1581803amr1046226866b.2.1790076392129;
        Tue, 22 Sep 2026 04:26:32 -0700 (PDT)
X-Received: by 2002:a17:906:ba89:b0:c29:5151:16b8 with SMTP id
 a640c23a62f3a-c2a1581803amr1046225866b.2.1790076391733; Tue, 22 Sep 2026
 04:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921195921.4174830-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260921195921.4174830-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Tue, 22 Sep 2026 08:26:20 -0300
X-Gm-Features: AcwNN1WFPYCIYdQMnG0J7f9SFhSPclnojOnaux6VqF9_nV_yNTRTszbi0d-qIZI
Message-ID: <CAABTaaC+vZmvg6s26oaYzkmnEvR42ZYcXutKfVNAa8VsK5ApDw@mail.gmail.com>
Subject: Re: [PATCH] audit: fix exe mark UAF in kill_rules()
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:07=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> kill_rules() removes mixed AUDIT_DIR and AUDIT_EXE rules when an audit
> tree is pruned. It drops entry->rule.exe before removing the rule from
> the RCU-visible filter lists.
>
> After a rule has been installed with AUDIT_ADD_RULE, which requires
> CAP_AUDIT_CONTROL, removing or moving the watched directory can race
> with another task that is still evaluating the rule. In that case,
> fsnotify can free the executable mark before the reader reaches
> audit_mark_compare(), causing a use-after-free.
>
> KASAN reports:
>
>     BUG: KASAN: slab-use-after-free in audit_mark_compare+0x8d/0xa0
>
> Remove the rule from the RCU-visible filter lists first, wait for a grace
> period, and only then drop the executable mark. audit_del_rule() already
> uses this ordering.
>
> Fixes: 34d99af52ad4 ("audit: implement audit by executable")
> Assisted-by: Codex:gpt-5
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  kernel/audit_tree.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
> index 1ed19b7..864a58b 100644
> --- a/kernel/audit_tree.c
> +++ b/kernel/audit_tree.c
> @@ -553,11 +553,12 @@ static void kill_rules(struct audit_context *contex=
t, struct audit_tree *tree)
>                 if (rule->tree) {
>                         /* not a half-baked one */
>                         audit_tree_log_remove_rule(context, rule);
> -                       if (entry->rule.exe)
> -                               audit_remove_mark(entry->rule.exe);
>                         rule->tree =3D NULL;
>                         list_del_rcu(&entry->list);
>                         list_del(&entry->rule.list);
> +                       synchronize_rcu();
> +                       if (entry->rule.exe)
> +                               audit_remove_mark(entry->rule.exe);
>                         call_rcu(&entry->rcu, audit_free_rule_rcu);
>                 }
>         }
> --
> 2.47.3
>
>

Hi J=C3=A9r=C3=A9my,

Thanks for troubleshooting and fixing this bug.

sashiko's review makes sense, though: synchronize_rcu() inside the
loop waits a full grace period per rule, and kill_rules() runs with
audit_filter_mutex held, so a tree with many rules stalls other audit
config operations. Below is an untested suggestion to use a single
grace period instead.

diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
index 1ed19b775912..5a3d7c7ba5ce 100644
--- a/kernel/audit_tree.c
+++ b/kernel/audit_tree.c
@@ -549,18 +549,30 @@ static void kill_rules(struct audit_context
*context, struct audit_tree *tree)
        list_for_each_entry_safe(rule, next, &tree->rules, rlist) {
                entry =3D container_of(rule, struct audit_entry, rule);

-               list_del_init(&rule->rlist);
                if (rule->tree) {
                        /* not a half-baked one */
                        audit_tree_log_remove_rule(context, rule);
-                       if (entry->rule.exe)
-                               audit_remove_mark(entry->rule.exe);
                        rule->tree =3D NULL;
                        list_del_rcu(&entry->list);
                        list_del(&entry->rule.list);
-                       call_rcu(&entry->rcu, audit_free_rule_rcu);
+               } else {
+                       list_del_init(&rule->rlist);
                }
        }
+
+       if (list_empty(&tree->rules))
+               return;
+
+       synchronize_rcu();
+
+       list_for_each_entry_safe(rule, next, &tree->rules, rlist) {
+               entry =3D container_of(rule, struct audit_entry, rule);
+
+               list_del_init(&rule->rlist);
+               if (entry->rule.exe)
+                       audit_remove_mark(entry->rule.exe);
+               call_rcu(&entry->rcu, audit_free_rule_rcu);
+       }
 }

 /*

--Ricardo

