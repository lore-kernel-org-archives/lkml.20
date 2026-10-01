Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A195B25B0B7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879807; cv=pass; b=p3OW71uMExTzNaniRF7SYwZTPzEHLuKnjpgm/4u4yKLm3FQqyMJ1vfLwkw95pFqVn7xrSI5SMBzkUjYSoogEFyw+22Bj3JQUfw1T8dnRDSJdJWOorOaVYFXkZBESQ8URn+qR6ktd8qBlJ47GMdksBiZNRuOp2vVac/cBU7q5hxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879807; c=relaxed/simple;
	bh=h6ZDc3QNxTyHIxVzBwpzzPrepUaNxkBMYzT7lDWtwII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIj7ghZiF4pwDYJxw5A/OXG5rMgxW6ddzJfFIoiMmjNtNN8zLl/GTpHHkEn6+HLeHmffk2E8JkCorrF1pnz/LxHeiLLJM5aC9vR/WunNxfjHrKR/GzEerMKCq97CFoQHu+NrwkSC7LvHZdCaZ8qdMROE8LmLPhjfmPeUUHeUrww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7YkGHGt; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7YkGHGt"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae9e33aa30so198831a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790879804; cv=none;
        d=google.com; s=arc-20260327;
        b=T+C9IU/gqWzX5ACZVIIHnnp8zDIaZA81NEJT+sC/ERv/eX6aggCb0P+DGKOubyht79
         +y/5f9RqVueBOi+W65ncU+al3WK8+JrZmrlKn2vJEooif9ndbxj7938GKg9odhqw5cih
         ZRPbeqmEGei7/Hon7GZHOnqPjcHGyVrVrTvR1UlA3dwYgE92Uprg2RqXvzLA/9fMzD1+
         UZw+Qs9twjehLSo4QjbWGfBTz+o3SuMdCCd+B5pgD06gThzrjnzDZoz0NhSTcq7dgPqw
         n8y2DZ4dYNVKYZvWrYHJ9TvvUEjQQ1uAQzcxatm3BfKD79bd7y53rA6W0FvIdDg1xl77
         E6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1eq00qogFi62RvxRx3HznoPzvIidCcZNC7wU8ibT4A=;
        fh=KhZqxuaSvLPkaIgkGl87nGDN618ejx9sVm760+TJ604=;
        b=GbRGVIleTemzKNd+Wxc93Q0qCjLQddA5E1cFhPO6ivP3owDgc7vIxmk++DfdQ4SHHd
         jVrnDwT3vh7/2h7XdbQOmOnNBF2eluAnuHQSBHz40Thi8gAmHT9IV+VTwq0GJF3cIFuQ
         0sZu4b/8P9tJ+8WlnUyk2ERZG1kAMmFOJsRKcXtX5yhU96l/O1XD1og7C6BQ9hzdMT0i
         QxUdrqsbxuTaFraegOv/HylEmsvmxRtanlv+5vH36JVgTM2pbzf0F05k/s4XA2W4vJ2M
         w2TdIGw2Q0yxzrxCp1CAYc4DOzo7eVwQBbdbOJhXmOrjpcULbS7woxwt8OM3djpipLjV
         BqMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790879804; x=1791484604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y1eq00qogFi62RvxRx3HznoPzvIidCcZNC7wU8ibT4A=;
        b=E7YkGHGta9liI7Bt1RWepyE1hxLGs6NgccOE/P99zYXkXq4VEyZ3WYi/bcXlvoqXgF
         uurT++ij9cucLM12Ki1KaY+SdPTh8NHkFKgTlzAjDAixwGIJTwfq372vBWk/3h81w6M+
         X61/n3WVMzdzOm2GfAr9fCsIPAvxWBKGZ5wT8JoKh+BXnhldkK6HL1aSRenGdMAqXrpO
         eRMMFQI5rTDFs2ZToSw3FevyoBD5Zj8rCwiQTN1Z/7R+O9zBd976aT6DyA9C3km8I5Zr
         OpIpCYhPHf0R02YgWhSat+g7V87OdtPpX2d2bnhWGbLwaQs3XVt13+yaTvmrJRjS5a++
         MgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879804; x=1791484604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1eq00qogFi62RvxRx3HznoPzvIidCcZNC7wU8ibT4A=;
        b=jDEJCaKmus5qt5ndbVNRn+28UVBATFhfHM/Tc4Ha5hyQERlZaDdUyoRVLof6T24eCM
         Y5nXjkHEBiaotxUlGjMV8bw0kGKZrWFirdiNlnqMTAxFf8mTnZeAcO4ykUpEkXp5tTnQ
         6v/MkDcYcRRvwp8KW4CXlU7Jc/Kcs9/zWf6dnA+z1Nwwt51l7NNLVWyqIOWBuR+X9neS
         /VsTM0ivc89fFjhckfzk4R/kImLzyrkKFOenSY1pI/ey1gIjKNv3OMifX2mJlE4HP5BV
         RwlljfLiC0aVUJYw3E+T8i4Mm/lI67VTAg6mEvH1ohuVyleyfQoYcSnV+NfhRIAbdt2F
         GR2A==
X-Forwarded-Encrypted: i=1; AKwUvBwAZY+EJieS/xAGC7aIKH4LflEMpU0xWZ4lTeg4lUnDRjmpMcOzKDzHmclfBRQJyUuZbepfa3/nmKKP6u8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbQh4t9GfXsm60XZRs9XsIZvgGdDoN5PtSr8LomiA8gTt3Q+j2
	AfPU4nbU6WUyp2cXgOypbXqSMt7XEc0uwQ6KyskILOCoVkBTN2Yn6pp8ReGGeqhYn4QJcp8UFw8
	KmskQHK88ziKeMFOCejcjLz8V2QGvbxU=
X-Gm-Gg: AYBFou1VkqxIlljTMP7L9WGmtTFVZTIF8yICtJ7JCngoSQ7q4tRu2rh8VhFV435+2cU
	dBlpzDCWOWEPJBOqb5dRSL+xUTD48Ic0kXOJo8EiAdTMPoW5AnVtkQ/t1LKDVJyPqJ+qrD6XT84
	jhyoPP+ZvzOr5ximPV/tl6ptmcv+pnr4IS3BDNRJfOmm4A/tpOp/fp0bPPwZEl9BLZpOYMYNrKY
	QzbgEzAeYpQ+SMtxzXGaYfSK2c6Bdu5C1SvzElvHkIw+PuugOUe5bzhoifGiB9r22q4KpwwR/zO
	DfPOhdKc77b8dg/vSkav6MCASnwiDeKNDduHwfB4BRKOxVk2uT85kzsCIWLJ3G1Q3OBR6tlH08o
	wKM7MluZ1ivQ=
X-Received: by 2002:a05:6402:2788:b0:6aa:490e:5518 with SMTP id
 4fb4d7f45d1cf-6af9e2bd88cmr52187a12.2.1790879803605; Thu, 01 Oct 2026
 11:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927180806.1315902-1-nicoyip.dev@gmail.com> <DU4P189MB375003EE2AE98DCE267919BCC68C2@DU4P189MB3750.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU4P189MB375003EE2AE98DCE267919BCC68C2@DU4P189MB3750.EURP189.PROD.OUTLOOK.COM>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Fri, 2 Oct 2026 02:36:31 +0800
X-Gm-Features: AclHuK83s5LQZF02BAi6-gZZEWeBzYRVR3hAdMjOt3X-IkJIg6MM2vqDCMiaXvU
Message-ID: <CAAo+4rURy0qZJ28b_WuNu8bnmKk7=opcDw5YC3AVageQLBUZsw@mail.gmail.com>
Subject: Re: [PATCH net] tipc: serialize publication purging with name table updates
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jon Maloy <jmaloy@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:14=E2=80=AFPM Tung Quang Nguyen
<tung.quang.nguyen@est.tech> wrote:
>
> >Subject: [PATCH net] tipc: serialize publication purging with name table=
 updates
> >
> >tipc_publ_notify() walks a failed node's publication list after the node=
 lock has
> >been released. Its list iterator is not protected by the name table lock=
, which is
> >only acquired inside tipc_publ_purge().
> >
> >CPU A can save the next publication before entering tipc_publ_purge().
> >CPU B then takes nametbl_lock in tipc_named_rcv(), processes a
> >WITHDRAWAL for that publication, unlinks it with list_del_init(), and qu=
eues it
> >for freeing with kfree_rcu(). CPU A advances to the removed publication =
and
> >loops on its self-linked binding_node, stalling the CPU.
> >
> >The kernel reported:
> >
> >  rcu: INFO: rcu_sched self-detected stall on CPU
> >  Call Trace:
> >   tipc_publ_notify+0x3b5/0x650
> >   tipc_node_write_unlock+0x49d/0x5d0
> >   tipc_node_link_down+0x15c/0x4a0
> >   tipc_node_delete_links+0xfc/0x190
> >   bearer_disable+0x111/0x270
> >   __tipc_nl_bearer_disable+0x1db/0x2f0
> >   tipc_nl_bearer_disable+0x1c/0x30
> >
>
> Please update your changelog with decoded stack trace.

Updated in v2.

> >Locking the entire traversal would also prevent the race, but would hold
> >nametbl_lock with bottom halves disabled while purging every publication=
.
> >A node with many publications could therefore cause excessive lock hold =
times
> >and delay other name-table operations.
> >
> >Move the failed node's publications to a private list under nametbl_lock=
, then
> >select and unlink its first entry under the same lock before purging it.
> >Concurrent withdrawals can still unlink entries from this private list, =
while
> >publications arriving after node recovery stay on the node's live list. =
No
> >publication pointer is carried across an unlocked interval.
> >
> >Unlink before the table lookup to make progress even if the lookup fails=
, and
> >acquire and release the lock for each publication. Check the private lis=
t under
> >the lock on every iteration, since concurrent withdrawals can still remo=
ve
> >entries. Keep withdrawal notifications and the final rc_dests update in =
their
> >existing order.
> >
> >Remove the failed-node address argument from tipc_publ_notify() and its
> >purge helper since unlinking no longer needs a node lookup.
> >
> >Fixes: 9db9fdd1983e ("tipc: avoid to asynchronously notify subscriptions=
")
> >Cc: stable@vger.kernel.org
> >Assisted-by: GPT-6-Astra
> >Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> >---
> > net/tipc/name_distr.c | 34 +++++++++++++++++++++++-----------
> > net/tipc/name_distr.h |  2 +-
> > net/tipc/node.c       |  2 +-
> > 3 files changed, 25 insertions(+), 13 deletions(-)
> >
> >diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c index
> >ba4f4906e13b..34867b69044c 100644
> >--- a/net/tipc/name_distr.c
> >+++ b/net/tipc/name_distr.c
> >@@ -227,38 +227,50 @@ void tipc_named_node_up(struct net *net, u32
> >dnode, u16 capabilities)
> >  * tipc_publ_purge - remove publication associated with a failed node
> >  * @net: the associated network namespace
> >  * @p: the publication to remove
> >- * @addr: failed node's address
> >  *
> >  * Invoked for each publication issued by a newly failed node.
> >  * Removes publication structure from name table & deletes it.
> >+ * The caller must hold nametbl_lock and unlink the node subscription.
> >  */
> >-static void tipc_publ_purge(struct net *net, struct publication *p, u32=
 addr)
> >+static void tipc_publ_purge(struct net *net, struct publication *p)
> > {
> >-      struct tipc_net *tn =3D tipc_net(net);
> >       struct publication *_p;
> >       struct tipc_uaddr ua;
> >
> >       tipc_uaddr(&ua, TIPC_SERVICE_RANGE, p->scope, p->sr.type,
> >                  p->sr.lower, p->sr.upper);
> >-      spin_lock_bh(&tn->nametbl_lock);
> >       _p =3D tipc_nametbl_remove_publ(net, &ua, &p->sk, p->key);
> >-      if (_p)
> >-              tipc_node_unsubscribe(net, &_p->binding_node, addr);
> >-      spin_unlock_bh(&tn->nametbl_lock);
> >       if (_p)
> >               kfree_rcu(_p, rcu);
> > }
> >
> > void tipc_publ_notify(struct net *net, struct list_head *nsub_list,
> >-                    u32 addr, u16 capabilities)
> >+                    u16 capabilities)
> > {
> >       struct name_table *nt =3D tipc_name_table(net);
> >       struct tipc_net *tn =3D tipc_net(net);
> >
> >-      struct publication *publ, *tmp;
> >+      struct publication *publ;
> >+      LIST_HEAD(purge_list);
> >+
> >+      spin_lock_bh(&tn->nametbl_lock);
> >+      /* Leave new publications on the node's list during the purge. */
> >+      list_splice_init(nsub_list, &purge_list);
> >+      spin_unlock_bh(&tn->nametbl_lock);
>
> After this lock is released, new publications can be inserted into node->=
publ_list. Does this defeat the purpose of current publication release ?

I think probably no. I understand that tipc_publ_notify() as to remove
the publications associated with the contact that has just failed. The
original traversal did not provide deterministic behavior for such
concurrent insertions. Since publications are appended with
list_add_tail(), list_for_each_entry_safe() could either reach a newly
inserted publication or miss it, depending on when the iterator saved
its next entry. The private list makes the node-down cleanup boundary
explicit.

> >+
> >+      for (;;) {
> >+              spin_lock_bh(&tn->nametbl_lock);
> >+              if (list_empty(&purge_list)) {
> >+                      spin_unlock_bh(&tn->nametbl_lock);
> >+                      break;
> >+              }
> >+              publ =3D list_first_entry(&purge_list, struct publication=
,
> >+                                      binding_node);
> >+              list_del_init(&publ->binding_node);
> >+              tipc_publ_purge(net, publ);
> >+              spin_unlock_bh(&tn->nametbl_lock);
> >+      }
> >
> >-      list_for_each_entry_safe(publ, tmp, nsub_list, binding_node)
> >-              tipc_publ_purge(net, publ, addr);
> >       spin_lock_bh(&tn->nametbl_lock);
> >       if (!(capabilities & TIPC_NAMED_BCAST))
> >               nt->rc_dests--;
> >diff --git a/net/tipc/name_distr.h b/net/tipc/name_distr.h index
> >c677f6f082df..8debe23469b2 100644
> >--- a/net/tipc/name_distr.h
> >+++ b/net/tipc/name_distr.h
> >@@ -74,6 +74,6 @@ void tipc_named_rcv(struct net *net, struct sk_buff_he=
ad
> >*namedq,
> >                   u16 *rcv_nxt, bool *open);
> > void tipc_named_reinit(struct net *net);  void tipc_publ_notify(struct =
net *net,
> >struct list_head *nsub_list,
> >-                    u32 addr, u16 capabilities);
> >+                    u16 capabilities);
> >
> > #endif
> >diff --git a/net/tipc/node.c b/net/tipc/node.c index
> >bd91378b7540..9a218d137c45 100644
> >--- a/net/tipc/node.c
> >+++ b/net/tipc/node.c
> >@@ -422,7 +422,7 @@ static void tipc_node_write_unlock(struct tipc_node
> >*n)
> >       write_unlock_bh(&n->lock);
> >
> >       if (flags & TIPC_NOTIFY_NODE_DOWN)
> >-              tipc_publ_notify(net, publ_list, node, n->capabilities);
> >+              tipc_publ_notify(net, publ_list, n->capabilities);
> >
> >       if (flags & TIPC_NOTIFY_NODE_UP)
> >               tipc_named_node_up(net, node, n->capabilities);
> >--
> >2.43.0
>

The node-lookup failure reported by sashiko is pre-existing and was
not introduced by the patch, but the patch relies on the affected
list-membership invariant, and the original publication release
implementation is also affected.

Since the race addressed in this patch and reported by sashiko are of
different root cause, I address both cases in v2 with a two-patch
series. Patch 1 replaces tipc_node_unsubscribe() with
list_del_init(&p->binding_node) while nametbl_lock is held and before
kfree_rcu(). Consequently, a failed node lookup can no longer cause a
remote publication to be freed while it remains on either
node->publ_list or the private purge list. Patch 2 fixes the problem
addressed by this v1 patch.

https://lore.kernel.org/netdev/20261001182924.3928331-1-nicoyip.dev@gmail.c=
om/

Best regards,
Chengfeng
