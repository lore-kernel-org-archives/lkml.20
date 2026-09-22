Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCC051CF56
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112971; cv=pass; b=WgvcPGEghwSQRgPbXeXxBMvizwFBccWz76cP5kkVyWoNDLBwiEjPOnbXgS4s1gpUOAYcdUTwXoe8cokX7J6jOPuy/Nc3xZE15dVZgvteQo0kbiU2bSU43Nz1l4Ey0eCWsEeos4y1PFLoKILesFAwuJKWCaZv9qpXd0Bh66giioY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112971; c=relaxed/simple;
	bh=EvbVhKnw8RPUu8cuHWn+MNXVd2g9HdJedBQyZE6JTgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMFwejrspnKWTJxI20PJa+Ygc3cUSrh/NtY03g28bzIkvCfBHxF/XdlVoKdz8l2S72M2XdtP95ExAeAn0O1xbkHP7ySNfZWApv7BHxWyPZ4IyM52HYUuGYe7nQU/AkZmjpD5Wzzu6kSSdYqqUwQO2ek3ZDbQ3T2JpY29vAGqeXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=ebwMKZtX; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="ebwMKZtX"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34907so319430b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790112945; cv=none;
        d=google.com; s=arc-20260327;
        b=GuM0aQIbov/0IES1WjYX7Kv4lcmBOadkDhcC1bN2gHFO9Ohg5Yop1coFEjwNhgptvR
         l4qJuq+aZ+o165Bl6g7Ns0u3qe14hSck7thmxjLYeeVkjQkdzeAouSB7d6okZVenDwQO
         MkYQzX7/SRtbEhE8dt1t7n4M/a+HwNpgLjC930aYwQ7skf7K5krL8w2tw5tby3K4acCY
         NGOaaNYLhqXaTfQUSnuf7wgerxKvt7KbOAXmKO9Y2TJuUSkmkCJU0RZ9J+dp2UOo200v
         zx/wUv2Igk1LEX2Bxt6rx8++v6/Ky5cJBq/i9Sz++UtL7vBbjoXr8SWXuriw4QJljMn5
         pAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdPzg2Ix4c1W2P1TMypn/Rnc27FR3sHCxu3cYUG6UQg=;
        fh=dcYLqah55M7xjflZJKmpQmnPVrSNP1ZIia6vPBJriSQ=;
        b=CWOVPqK4mMIYM69bWG5h40aUWD2N2CnOrPpuxfmsdbvaHad1Xn5LfaMlu17gX6eBD5
         0qZiWiOFpClibqp2g7eaj9o//UvQT1RPptcac93glt8NnpsR/PVy9qrbbdcoHZlVrcix
         A6efSXc/YoH8mHINM9JYlC6smCTJ8DCmCzybVCb3MeTyFa43/+fENILlnkMdRFe1f+EO
         BFkxf/m7Bl5Hs8zn02BFl1SXg325MJXf4SEq/WBebP690mhYCVciu+nrOTer3QNQvxsJ
         8+NgvrkMf1FG5s0Dru8cRMfwnRlCLmkxeeEmTDZ2J/x4vPTrMrGpG64rrXv1P1SCACyR
         6yNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1790112945; x=1790717745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdPzg2Ix4c1W2P1TMypn/Rnc27FR3sHCxu3cYUG6UQg=;
        b=ebwMKZtXQoXr3R9QTAZaITAjdkRxXnvNB4hA0ksEIQWNDChemNo1KmbtHdlTL7uvjg
         rnVEKZIeoG95s+Xj0juBpBCTFT0OKt+3XJClWr/pWt5ksopTlbsg1tlf1eLE2UG71bI2
         BbUHovLiCWjiy9ExQWHHWuC6qWeLGMUcvWzRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790112945; x=1790717745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdPzg2Ix4c1W2P1TMypn/Rnc27FR3sHCxu3cYUG6UQg=;
        b=HpfC2QBLdmwbKyBa182Syv9NXXDvp5kTB+rE6cRI1OSKHgRm96nNTU2hxLORLlE4Sh
         t5sWeVHcIitmq2SANBlM/fyOGxfI2IH9dEkLftuAvOxMzkhyXpEf3v2hDl2ln0HM+Qcy
         C8h3iX1DMGLZeXO4r5iP0tbUgVQhDQ1NweNufuu+iRIFT2mUQ4PFqszf/JQoJBKZaGFP
         UBWcYnXZfR5C4s9MX47RuMmMbSAInUplM2+ulzwwh+fFGli464gNAcv5yImuyVza70Zf
         dS/V1fDJqOyhDqBHAGnBYzWgPnT5bqzf2pLeu/DZte1tsA51T+aXSE/HGu4FAkq9FSZq
         Kvgw==
X-Forwarded-Encrypted: i=1; AKwUvBwkku0KjlFPUdA736Wrg1IFTjohzGGHTZKii3ULwiZxEwAh8vAVU5qOag/XT3x9HUn5Nt78V1s25TLLmv0=@vger.kernel.org
X-Gm-Message-State: AFuF++lg3X91PXVWKcsgYBS3C22GcH091OBUWuHR5soL7PYeWmHMn7By
	I6jCVr72+xsZcO4TVeY5PgzJExHIjvXXKJ8n6O6E/p5IdaS0yGXdlOkCHoyeu4yWpYSVJwv/9iG
	TD7wdPuGGOV6Y0OHj4gLi6sk4AXX4v3n0pKP+0YUH
X-Gm-Gg: AYBFou0fIowwXavKPpV4THfY3+AhwK6Ielvkpw3GdaeQVkcZFoOjR20aZcfev0C4f1D
	WdF/B1GJO3w3X64jGkLe0zuim3ebdOKmWRKHnAM0pPJPApKIckeTlhxcJAgpDi2lCt5oPcgJKfP
	rnKUCfainBchVYDyJVXSBC9mGNkBDTgivIZE2U8mQ5/3cmuQmhL4bEnNgC0McZN/+9r3eZt9h4r
	29VClIp0YFKaBGOznZ9rALB5tC2Hk6CXkvTzDOGsbWEFtcLcplaNU2lFTj3J3uMZCjgYR/WtP6K
	bjRJJOvcZvmQQ+XSpszI0Dv7N/2dQvrnajkuowIFQ7wKa/dUK/bgJrp3954fWVwdF4T6ivwvH0B
	ucmbkbJOU8JMqgOvWbWbibDWz48lLZdIrTuW/3rHLBSw7
X-Received: by 2002:a05:6a00:44c5:b0:874:708d:b62b with SMTP id
 d2e1a72fcca58-87d1b8a15admr654286b3a.32.1790112945505; Tue, 22 Sep 2026
 14:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921145655.3167436-1-i.maximets@ovn.org> <20260921145655.3167436-6-i.maximets@ovn.org>
In-Reply-To: <20260921145655.3167436-6-i.maximets@ovn.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 22 Sep 2026 17:35:32 -0400
X-Gm-Features: AcwNN1WPL-vgVShl6hqSyik6C8tmu3eMWMaigjhCeY6OG6KGXvvi-22yq5biirU
Message-ID: <CAM0EoMk96wo2-kupgidntihfxij_zffq2v=ddH-mGUNUH0q7Wg@mail.gmail.com>
Subject: Re: [PATCH net 5/6] net/sched: act_ct: remove 'add_helper' dead code
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Aaron Conole <aconole@redhat.com>, 
	Eelco Chaudron <echaudro@redhat.com>, Jiri Pirko <jiri@resnulli.us>, Xin Long <lucien.xin@gmail.com>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, linux-kernel@vger.kernel.org, dev@openvswitch.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 10:57=E2=80=AFAM Ilya Maximets <i.maximets@ovn.org>=
 wrote:
>
> This variable can only become 'true' when the connection is not
> confirmed, but it is only checked when it is confirmed.  So, it can be
> treated as being always false and just removed.
>
> Fixes: a21b06e73191 ("net: sched: add helper support in act_ct")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>

Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal
> ---
>  net/sched/act_ct.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/sched/act_ct.c b/net/sched/act_ct.c
> index e72143d36b119..f62051ec9d57d 100644
> --- a/net/sched/act_ct.c
> +++ b/net/sched/act_ct.c
> @@ -986,7 +986,6 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb,=
 const struct tc_action *a,
>         struct nf_hook_state state;
>         int nh_ofs, err, retval;
>         struct tcf_ct_params *p;
> -       bool add_helper =3D false;
>         bool skb_is_ours =3D false;
>         bool skip_add =3D false;
>         bool defrag =3D false;
> @@ -1096,14 +1095,14 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *=
skb, const struct tc_action *a,
>                 err =3D __nf_ct_try_assign_helper(ct, p->tmpl, GFP_ATOMIC=
);
>                 if (err)
>                         goto drop;
> -               add_helper =3D true;
> +
>                 if (nat && !nfct_seqadj(ct)) {
>                         if (!nfct_seqadj_ext_add(ct))
>                                 goto drop;
>                 }
>         }
>
> -       if (nf_ct_is_confirmed(ct) ? ((!cached && !skip_add) || add_helpe=
r) : commit) {
> +       if (nf_ct_is_confirmed(ct) ? (!cached && !skip_add) : commit) {
>                 err =3D nf_ct_helper(skb, ct, ctinfo, family);
>                 if (err !=3D NF_ACCEPT)
>                         goto nf_error;
> --
> 2.55.0
>
