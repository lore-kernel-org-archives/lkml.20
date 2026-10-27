Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793099800;
	b=GfP4UEEW5CNfN+ENPxsAPVIStaO93pyqTVOB+whqBEf1J3fhGvCK3wtK6RComofgUY88
	 wAIKeFqBlfWVmh2L+u5z7r9tJPY6kGox3g/y4AHXQTiuaoRS7eVG3GrAzLOyJVQ8e/qFv
	 e0mHYpb35QJ+jPAUV0wrwiL0+pTyAMwFYBs6SuIAKQhLk1o8KqCDCS/JnY18CpSDcO5Yb
	 0AATW6E6oeSqKc1meQHQhQcyzjYGg3NGLMVyae0oxDEWW1YXgg50nMeoVgtjZfc0PlJbx
	 baTv4rcQ3x2EsoTg06jz73NzzDpOJmDTTnhJYgLQGE/QqGo4BOJ4SzWQH1nLkRM1eNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5deC3X/qxpVsXoeGtzPsqbNEXUMUJEJ5cVWR11tROm4=;
	b=NhHWsAmZdJin3GtnmUwgLq05tdIWZv6q0RHVfUdEoOGbWRac+wfKClCNrIHDhNtzXSKM
	 lT9Nbfd+tHHRCK0eBfIslBfK5QGmC8B1temvDWKkKGllibh0G6TivnV3FxVazqeZIWXKX
	 l2SMffASSS29SMLKCApU62vEm5tq3rCdnDYFvqkDAr7XrnssOTXMB+meQclUPn75HusGz
	 iP7Zngk4KQ3wTr/xHFq3bfxkz9JA2mo65PrZOMNFYpgle3g07jjG1F/PWxW34lTmdSo7S
	 dR567MdxVQJDW1hxB7YpsAe7U/SvMGMfbbvqEO9J8DJfY+/S2RtwThfEqkeezD9QCNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OItje1WS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24772606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24772606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OItje1WS
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae14ee2d0bso960860a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793099798; cv=none;
        d=google.com; s=arc-20260327;
        b=eifd2PbI7+Wt6xZR8YXBnOvSm+EAeNxjdsggrKIF+q3bueO0wy+vw4r6qWxJOlGCYx
         wvdQyzs27dMV4+8yZ+WzUUMTMa5ZAFvrHum7yp389yfuWJVaO6FLMtN1JdOnwtT4mZRF
         8UHCYKChveIQCWlQ4Owscl5AxzQsK+MUwuCJRxTIoyg5/N0Kir79SJcksSjqhhpgZY1U
         5MzwU2v2oQmnTwnA/KDzckEoDV6dYGEA2N8BD6xlbMhqvRltZa85vPsfqvX3P5P5XdTs
         3AcPxv6P+fOTXF2S/p938Eo+DauDBF/gjzkEEEDs6DGVQCCynM/p6fwe125JZ2Zw9Y9H
         b07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5deC3X/qxpVsXoeGtzPsqbNEXUMUJEJ5cVWR11tROm4=;
        fh=1HfVfRg5ENoENfLYLKhJw0bLW1kYx3kBy6WQWJPOZQw=;
        b=H+aRs+nH4TGhSMBuaZvBDQ+wvs+K2fYZffGpKqWbMAM1Y73IwptFukYo3jL/vX4tvg
         5t/rHsxN2smZCzQIiPkPjLdMMZYj3wNDk1ThANBsekpPDWkLV2cbuGXVuvHutVXzQqqt
         jwVAherMTyzVGXQ2fFmerwiYVJdbDH3sdzdw17GIVKkpKSpF7yFVVK1NV5DCTrmHpT8M
         hqj7cw4uB8OaXjqn4FCdNUaVz5YWIEl/ZKf2CQtAPwbdqkLEJbbGWg55QqRPyRa31W4l
         7HltW/TI7ClB/xPY8UxqWReVe1Wy1uJEUlvY1jJkFl94JuyxcQtsD1mcxvVzJBbBykn2
         aXnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793099798; x=1793704598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5deC3X/qxpVsXoeGtzPsqbNEXUMUJEJ5cVWR11tROm4=;
        b=OItje1WSFvSTAstbC+cKC8DxLKsH6FK00DsAH49fDoZJM4EO4zDF2cvDcuLWO+uzqS
         cwjlALT5y/XfGhvM4NumPBnnVtxNqkR274zklkWGeYtVGVPN4X0HGCVFnT1uEGvZRnK7
         nXvBVKdVT5peHBHwly80YwSc2w3NABFnUY8bZGMi2yFkaqhryZnZWRgqoM0rAmgcTW4G
         pPB5Peow/dCV1LKs0Gr8WiSaFfXJkB9ZXZirPTqoTFLn1wrkdx2lWaZq8u0i4zyWP8C6
         bjNEwN2uU/Eooo6t5vu7Fbts5LKooztoJbsyPQReD97VrA6+GO8rzx9/4/oX8l3nJXwk
         paPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099798; x=1793704598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5deC3X/qxpVsXoeGtzPsqbNEXUMUJEJ5cVWR11tROm4=;
        b=ctPWJXitDS7tBNik0mzpA8MkA+qmEhcvszN3Fw5hW9XyzriXpMhwmBGvu1wjt7EsSA
         Q/kqA5KEAi05mpMQlKCSnijdxykBGRWYfmD7StlGjzyCJ/qHj95OJKRkTPUWjQ7nwQby
         umEPQ2jdyYqv/wdlqnCFo8gZlCXM1RpfwYf9JbPnlgkK5GNSYVOQj0o5hpKC36MCd9Zz
         U5OS9SWX72YSdgofgADF9Ik82l9rTrVLFuasD2vdB4d4BkmAR09mlq5Id1WIv9IVYOwJ
         YaC//jffPB5I4hUWuDhpavTnvKfco5b/irVH5B/JL+3VYXe3rnZk1c+MilTqC23xwF0b
         WB4g==
X-Forwarded-Encrypted: i=1; AKwUvByvyxNVyeEAE4DYr0XMzgBHL3jNvV3yZuiXdL6gGGfWCS/njyg4BfyABHwdQ+UFeJxoVVn9sj59/D805b8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8aLnfCyUtFRQFpIELmewXZw333bF5tH8eIQWx7HpbAsdg7aB/
	FrRqQTBvXNOKNGZ4UEYVRrU4MwZ3nBdekPdWM5jaWV2HmEnHlyCF2q9/4TT3hllZU4h4y3QTUSU
	RnK0u7/HDdppS7soWToJOE2cL2/8+Gk8=
X-Gm-Gg: AYBFou0zb/K2Z8Iv3z/n5ZsAPyHQ6FxXiu9y7WTXNFWjfOh471qlFKu7L1TResYhUbG
	U16o/mA+2pxP1Xns++fCO1ySYWD/EMAMznAtW5ThLt8F9F2C6sblAdVQQmpG92W7WCI0odOTO78
	2bezuUSpOSNdvZHH1FaMwmB5olGMHyYxOQCXY4ga6aa5JzTcZ6NFX/ec7PsjZ1yh6aqMy/ZxPyt
	TAkzV58lr6htYKCDDyp5Nd+ll/HBQDMXdfsZgzIF3Fts3Hwaq6Bs5WjvVC1D47+eUYN1YQWNivf
	AUGQXwCQT1LLSnIQUekQN1cPug245OeeuYWVx10J6EmgqXCcd+0pX/WvIFbeYTpQN1YfNpWIbS4
	VAna5/CdGLk6YMSTpwradvEWcru7LRYwVxd4qA7LELp7wOmywxEIsyYwQfAT3vOyVzSy4
X-Received: by 2002:a05:6402:a205:20b0:6b4:28d7:7b63 with SMTP id
 4fb4d7f45d1cf-6b4429fa178mr11365764a12.0.1793099798184; Tue, 27 Oct 2026
 04:16:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013091716.1210420-1-nicoyip.dev@gmail.com>
 <20261013091716.1210420-3-nicoyip.dev@gmail.com> <atisUaV2eIC2yTvX@linux.alibaba.com>
In-Reply-To: <atisUaV2eIC2yTvX@linux.alibaba.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Tue, 27 Oct 2026 19:16:26 +0800
X-Gm-Features: AclHuK_A9PQEX0bWaCldRlg_sgr4SoZSYs9VVnOgllyUlJVTjvMgBfD6Uvd22n8
Message-ID: <CAAo+4rXas4BS85yfiDSPvDhzpWkjoKBiZSHn9VeV0VcATTO0Aw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/3] net/smc: serialize early link group cleanup
 with termination
To: dust.li@linux.alibaba.com
Cc: alibuda@linux.alibaba.com, sidraya@linux.ibm.com, mjambigi@linux.ibm.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	tonylu@linux.alibaba.com, guwen@linux.alibaba.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dust,

Sorry for the late reply.

On Wed, Oct 21, 2026 at 8:13=E2=80=AFPM Dust Li <dust.li@linux.alibaba.com>=
 wrote:
>
> On 2026-10-13 17:17:15, Chengfeng Ye wrote:
> >smc_lgr_cleanup_early() enters __smc_lgr_terminate() even when another
> >teardown path has already claimed lgr->freeing. Both callers can observe
> >lgr->terminating clear before either sets it, then tear down the same
> >link group, causing use-after-free and duplicate resource release.
> >
> >  BUG: KASAN: use-after-free in __smc_lgr_terminate+0x393/0x3a0
> >  Write of size 1 at addr ffff8880bf2c0300 by task poc/106
> >  Call Trace:
> >   __smc_lgr_terminate+0x393/0x3a0
> >   __smc_connect+0x2e3d/0x4930
> >   smc_connect+0x42c/0x580
> >   __sys_connect+0xfc/0x130
> >   __x64_sys_connect+0x6d/0xb0
> >
> >Check freeing under the link group list lock before unlinking the group
> >or entering termination. The existing locked freeing transition then
> >claims exclusive teardown ownership; an early cleanup that loses the
> >claim leaves teardown to the existing owner and does not remove the grou=
p
> >from a device teardown's private list.
> >
> >Keep a temporary link group reference across smc_conn_free() and early
> >cleanup in smc_conn_abort(). Once the connection is unregistered, a
> >termination worker can finish without taking its socket lock. The extra
> >reference keeps the allocation alive until the ownership check returns.
> >
> >A new group is published before its first connection is registered. Hold
> >it before publication until registration or failed-registration cleanup
> >finishes. The reference keeps the allocation alive, but teardown can sti=
ll
> >destroy the group's resources before registration. Take the list lock
> >around the freeing check and first registration, nesting conns_lock as i=
n
> >the reuse path. Reject a group already claimed for teardown and clear
> >conn->lgr, since that connection never acquired a group reference.
> >
> >On success, acquire the connection reference before dropping the tempora=
ry
> >hold. A later terminator sees the registered connection and must acquire
> >its socket lock before removing it. On failure, keep the temporary hold
> >through early cleanup and then release it. Reused groups retain their
> >existing reference protocol.
> >
> >This depends on "net/smc: serialize link group free work scheduling" for
> >the standalone freeing bool and the locked early-cleanup transition.
> >
> >Fixes: f9aab6f2ce57 ("net/smc: immediate freeing in smc_lgr_cleanup_earl=
y()")
> >Cc: stable@vger.kernel.org
> >Assisted-by: GPT-6.1-Sol
> >Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> >---
> >Changes in v3:
> >- Serialize first registration with the teardown claim under the group l=
ist
> >  lock, nesting conns_lock in the same order as connection reuse.
> >- Reject groups already being freed and clear conn->lgr on that path.
> >- Document the scheduling fix prerequisite in the permanent commit messa=
ge.
> >
> >Changes in v2:
> >- Pin newly created link groups before publication, covering the
> >  registration failure handoff to early cleanup. Drop the temporary hold
> >  after cleanup on failure, or after the connection hold on success.
> >- Send after the free-work scheduling fix and reuse its standalone
> >  freeing bool and locked early-cleanup transition.
> >- Pin the link group across the smc_conn_abort() early-cleanup ownership
> >  check.
> >
> >v1: https://lore.kernel.org/r/20260927063607.3691520-1-nicoyip.dev@gmail=
.com/
> >
> >v2: https://lore.kernel.org/r/20261003183237.2284245-3-nicoyip.dev@gmail=
.com/
> >
> > net/smc/af_smc.c   |  8 ++++++--
> > net/smc/smc_core.c | 21 ++++++++++++++++++---
> > 2 files changed, 24 insertions(+), 5 deletions(-)
> >
> >diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
> >index e9f93b3ab435..97b0a0b51066 100644
> >--- a/net/smc/af_smc.c
> >+++ b/net/smc/af_smc.c
> >@@ -1011,12 +1011,16 @@ static void smc_conn_abort(struct smc_sock *smc,=
 int local_first)
> >       struct smc_link_group *lgr =3D conn->lgr;
> >       bool lgr_valid =3D false;
> >
> >-      if (smc_conn_lgr_valid(conn))
> >+      if (local_first && smc_conn_lgr_valid(conn)) {
> >               lgr_valid =3D true;
> >+              smc_lgr_hold(lgr);
> >+      }
> >
> >       smc_conn_free(conn);
> >-      if (local_first && lgr_valid)
> >+      if (lgr_valid) {
> >               smc_lgr_cleanup_early(lgr);
> >+              smc_lgr_put(lgr);
> >+      }
> > }
> >
> > /* check if there is a rdma device available for this connection. */
> >diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
> >index 660cd41ec720..c1bb284c4233 100644
> >--- a/net/smc/smc_core.c
> >+++ b/net/smc/smc_core.c
> >@@ -693,6 +693,10 @@ void smc_lgr_cleanup_early(struct smc_link_group *l=
gr)
> >
> >       smc_lgr_list_head(lgr, &lgr_lock);
> >       spin_lock_bh(lgr_lock);
> >+      if (lgr->freeing) {
> >+              spin_unlock_bh(lgr_lock);
> >+              return;
> >+      }
> >       /* do not use this link group for new connections */
> >       if (!list_empty(&lgr->list))
> >               list_del_init(&lgr->list);
> >@@ -999,6 +1003,7 @@ static int smc_lgr_create(struct smc_sock *smc, str=
uct smc_init_info *ini)
> >               lgr->buf_type =3D lgr->net->smc.sysctl_smcr_buf_type;
> >               atomic_inc(&lgr_cnt);
> >       }
> >+      smc_lgr_hold(lgr); /* lgr_put in smc_conn_create() */
> >       smc->conn.lgr =3D lgr;
> >       spin_lock_bh(lgr_lock);
> >       list_add_tail(&lgr->list, lgr_list);
> >@@ -2049,15 +2054,25 @@ int smc_conn_create(struct smc_sock *smc, struct=
 smc_init_info *ini)
> >               if (rc)
> >                       goto out;
> >               lgr =3D conn->lgr;
> >-              write_lock_bh(&lgr->conns_lock);
> >-              rc =3D smc_lgr_register_conn(conn, true);
> >-              write_unlock_bh(&lgr->conns_lock);
> >+              spin_lock_bh(lgr_lock);
> >+              if (lgr->freeing) {
> >+                      conn->lgr =3D NULL;
> >+                      rc =3D SMC_CLC_DECL_SYNCERR;
>
> This should not be SMC_CLC_DECL_SYNCERR, maybe SMC_CLC_DECL_INTERR or add
> a new error code.

No problem, I will use SMC_CLC_DECL_INTERR in v4.

> >+              } else {
> >+                      write_lock_bh(&lgr->conns_lock);
> >+                      rc =3D smc_lgr_register_conn(conn, true);
> >+                      write_unlock_bh(&lgr->conns_lock);
> >+              }
> >+              spin_unlock_bh(lgr_lock);
> >               if (rc) {
> >                       smc_lgr_cleanup_early(lgr);
> >+                      smc_lgr_put(lgr); /* lgr_hold in smc_lgr_create()=
 */
>
> smc_lgr_put() may call smcr_buf_free() -> vfree(), which may sleep.
> And you put it in the spinlock.

It seems the smc_lgr_put(lgr) is added after the
spin_unlock_bh(lgr_lock). Were you referring to another lock held by a
caller? I will keep this unchanged in v4, let me know if anything
should be adjusted further.

> Best regards,
> Dust
>

Best regards,
Chengfeng
