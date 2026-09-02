Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6081416851;
	Wed,  2 Sep 2026 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344337; cv=none; b=mJ8oKss8VpRgT65e/1vKKnYWPBWvU9QW5N32f801wuXfPFvUnkAONyyaVwf+FuuJgmOJwVS6vGzYFhAVEkp6wpxxNEqbWPxJajUh1suA2WegBYn0EWFA1ah8Qb7p6jtPDpW9mg0ON4MGmvraCfLk2MqjsSYDcU9rIjb4TxABJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344337; c=relaxed/simple;
	bh=nxDtJ3voWfLVljumrp1EK5iG1Ymz6qvnCkXN1KBc6ME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHJw1nmAkPyfOQV51v1MoHmQtH6ZoODsPini0oLBw/9Gc+Sk5+VBQwsOwGezfxnxAjbopI/bk+4rLSVidQGupkz8WQmYpENCOGPCnkEW2SA181jLemRCe977tl3EsAinYt8C19RHskRNkzI2bZePNQOa7JMyVGKRR/+9RyU1y7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDQMXmRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDQMXmRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9051F000E9;
	Wed,  2 Sep 2026 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344335;
	bh=lluYSS7v2uXJQ8D2Kp1xFmd0Ggc+FK10HqR8kKP/x/Q=;
	h=Date:From:To:Cc:Subject;
	b=eDQMXmRr8FsWk66QqxFbPr1tbmiYvcFrVzcOE1chS/PO9D9Fr2YSKKD++ES/NNYVr
	 I90p9jETLvloHeefu6lIWgdQqEbm0dVDbiOXH8t7xtMWFax9cmkxQgqf4K1GdlvEvP
	 WtP67erw31GWZeKF4cjpOTY8xJTeXMQ8y5Jl+bbPDPz+XRQ0hCUgp9Ek0GQtcRrdmH
	 KQv/tUQ/UOuWL0JsTTae3beKiI8fgw2loABzPpP4mB/4+9dlKY3nJVW/TXv/EX48ZD
	 KNWYjiiOYApS0kNFxVM6KEh0TgnNSOyuQyKcDDe0ZzdajfGFBTY5Z/Ntk6EQF1oZ08
	 p93v4aR2u0FLA==
Date: Wed, 2 Sep 2026 11:18:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Eric Dumazet <edumazet@google.com>, Gregory Price <gourry@gourry.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the mm
 tree
Message-ID: <apf4DALeG-acsE8t@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i8Dr5CYepe3zQNsO"
Content-Disposition: inline


--i8Dr5CYepe3zQNsO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  mm/mempolicy.c

between commits:

  61f04edb01700 ("mm/mempolicy: fix sleeping allocation in alloc_pages_bulk=
_weighted_interleave()")
  5da38ed988084 ("mm/mempolicy: use SRCU for the weighted interleave state")

=66rom the mm tree and commit:

  540e583b66d64 ("mm/mempolicy: fix sleeping allocation in alloc_pages_bulk=
_weighted_interleave()")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/mempolicy.c
index 2ad0a5f18280a,79053ece02cd4..0000000000000
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@@ -112,7 -112,6 +112,7 @@@
  #include <linux/printk.h>
  #include <linux/leafops.h>
  #include <linux/gcd.h>
 +#include <linux/srcu.h>
 =20
  #include <asm/tlbflush.h>
  #include <asm/tlb.h>
@@@ -158,7 -157,6 +158,7 @@@ static const int weightiness =3D 32
   */
  struct weighted_interleave_state {
  	bool mode_auto;
 +	struct rcu_head rcu;
  	u8 iw_table[];
  };
  static struct weighted_interleave_state __rcu *wi_state;
@@@ -170,24 -168,6 +170,24 @@@ static unsigned int *node_bw_table
   */
  static DEFINE_MUTEX(wi_state_lock);
 =20
 +/* Readers that sleep while walking iw_table hold this instead */
 +DEFINE_STATIC_SRCU_FAST(wi_srcu);
 +
 +static void wi_state_free_rcu(struct rcu_head *head)
 +{
 +	struct weighted_interleave_state *state =3D
 +		container_of(head, struct weighted_interleave_state, rcu);
 +
 +	kfree_rcu(state, rcu);
 +}
 +
 +/* Retire through both flavors: sleeping readers use SRCU, the rest RCU */
 +static void wi_state_retire(struct weighted_interleave_state *state)
 +{
 +	if (state)
 +		call_srcu(&wi_srcu, &state->rcu, wi_state_free_rcu);
 +}
 +
  static u8 get_il_weight(int node)
  {
  	struct weighted_interleave_state *state;
@@@ -286,7 -266,10 +286,7 @@@ int mempolicy_set_node_perf(unsigned in
  	rcu_assign_pointer(wi_state, new_wi_state);
 =20
  	mutex_unlock(&wi_state_lock);
 -	if (old_wi_state) {
 -		synchronize_rcu();
 -		kfree(old_wi_state);
 -	}
 +	wi_state_retire(old_wi_state);
  out:
  	kfree(old_bw);
  	return 0;
@@@ -679,8 -662,6 +679,8 @@@ static void queue_folios_pmd(pmd_t *pmd
  		return;
  	}
  	folio =3D pmd_folio(pmdval);
 +	if (folio_is_zone_device(folio))
 +		return;
  	if (is_huge_zero_folio(folio)) {
  		walk->action =3D ACTION_CONTINUE;
  		return;
@@@ -2199,15 -2180,34 +2199,15 @@@ unsigned int mempolicy_slab_node(void
  	}
  }
 =20
 -static unsigned int read_once_policy_nodemask(struct mempolicy *pol,
 -					      nodemask_t *mask)
 -{
 -	/*
 -	 * barrier stabilizes the nodemask locally so that it can be iterated
 -	 * over safely without concern for changes. Allocators validate node
 -	 * selection does not violate mems_allowed, so this is safe.
 -	 */
 -	barrier();
 -	memcpy(mask, &pol->nodes, sizeof(nodemask_t));
 -	barrier();
 -	return nodes_weight(*mask);
 -}
 -
  static unsigned int weighted_interleave_nid(struct mempolicy *pol, pgoff_=
t ilx)
  {
  	struct weighted_interleave_state *state;
 -	nodemask_t nodemask;
 -	unsigned int target, nr_nodes;
 +	unsigned int target, nnodes =3D 0;
  	u8 *table =3D NULL;
  	unsigned int weight_total =3D 0;
  	u8 weight;
  	int nid =3D 0;
 =20
 -	nr_nodes =3D read_once_policy_nodemask(pol, &nodemask);
 -	if (!nr_nodes)
 -		return numa_node_id();
 -
  	rcu_read_lock();
 =20
  	state =3D rcu_dereference(wi_state);
@@@ -2215,40 -2215,22 +2215,40 @@@
  	if (state)
  		table =3D state->iw_table;
 =20
 -	/* calculate the total weight */
 -	for_each_node_mask(nid, nodemask)
 +	/* calculate the total weight and the node count */
 +	for_each_node_mask(nid, pol->nodes) {
  		weight_total +=3D table ? table[nid] : 1;
 +		nnodes++;
 +	}
 +
 +	/* the mask is empty */
 +	if (!weight_total) {
 +		rcu_read_unlock();
 +		return numa_node_id();
 +	}
 =20
  	/* Calculate the node offset based on totals */
  	target =3D ilx % weight_total;
 -	nid =3D first_node(nodemask);
 -	while (target) {
 +	nid =3D first_node(pol->nodes);
 +
 +	/*
 +	 * The target was calculated in a separate loop, and a concurrent
 +	 * rebind can change the total number of nodes.  Clamp this loop to
 +	 * a single pass (nnodes) to keep the walk bounded by node count.
 +	 */
 +	while (target && nnodes-- && nid < MAX_NUMNODES) {
  		/* detect system default usage */
  		weight =3D table ? table[nid] : 1;
  		if (target < weight)
  			break;
  		target -=3D weight;
 -		nid =3D next_node_in(nid, nodemask);
 +		nid =3D next_node_in(nid, pol->nodes);
  	}
  	rcu_read_unlock();
 +
 +	/* the mask emptied under the walk */
 +	if (nid >=3D MAX_NUMNODES)
 +		return numa_node_id();
  	return nid;
  }
 =20
@@@ -2259,21 -2241,18 +2259,21 @@@
   */
  static unsigned int interleave_nid(struct mempolicy *pol, pgoff_t ilx)
  {
 -	nodemask_t nodemask;
  	unsigned int target, nnodes;
  	int i;
  	int nid;
 =20
 -	nnodes =3D read_once_policy_nodemask(pol, &nodemask);
 +	nnodes =3D nodes_weight(pol->nodes);
  	if (!nnodes)
  		return numa_node_id();
  	target =3D ilx % nnodes;
 -	nid =3D first_node(nodemask);
 -	for (i =3D 0; i < target; i++)
 -		nid =3D next_node(nid, nodemask);
 +	nid =3D first_node(pol->nodes);
 +	for (i =3D 0; i < target && nid < MAX_NUMNODES; i++)
 +		nid =3D next_node_in(nid, pol->nodes);
 +
 +	/* the mask emptied under the walk */
 +	if (nid >=3D MAX_NUMNODES)
 +		return numa_node_id();
  	return nid;
  }
 =20
@@@ -2613,7 -2592,6 +2613,7 @@@ static unsigned long alloc_pages_bulk_i
  		struct mempolicy *pol, unsigned long nr_pages,
  		struct page **page_array)
  {
 +	unsigned int cpuset_mems_cookie;
  	int nodes;
  	unsigned long nr_pages_per_node;
  	int delta;
@@@ -2621,16 -2599,7 +2621,16 @@@
  	unsigned long nr_allocated;
  	unsigned long total_allocated =3D 0;
 =20
 -	nodes =3D nodes_weight(pol->nodes);
 +	/* count the nodes, retry if a rebind happened during the read */
 +	do {
 +		cpuset_mems_cookie =3D read_mems_allowed_begin();
 +		nodes =3D nodes_weight(pol->nodes);
 +	} while (read_mems_allowed_retry(cpuset_mems_cookie));
 +
 +	/* if the nodemask has become invalid, we cannot do anything */
 +	if (!nodes)
 +		return 0;
 +
  	nr_pages_per_node =3D nr_pages / nodes;
  	delta =3D nr_pages - nodes * nr_pages_per_node;
 =20
@@@ -2665,10 -2634,10 +2665,10 @@@ static unsigned long alloc_pages_bulk_w
  	unsigned long nr_allocated =3D 0;
  	unsigned long rounds;
  	unsigned long node_pages, delta;
 -	u8 *weights, weight;
 +	struct srcu_ctr __percpu *scp;
 +	u8 *table, weight;
  	unsigned int weight_total =3D 0;
  	unsigned long rem_pages =3D nr_pages;
 -	nodemask_t nodes;
  	int nnodes, node;
  	int resume_node =3D MAX_NUMNODES - 1;
  	u8 resume_weight =3D 0;
@@@ -2678,10 -2647,10 +2678,10 @@@
  	if (!nr_pages)
  		return 0;
 =20
 -	/* read the nodes onto the stack, retry if done during rebind */
 +	/* count the nodes, retry if a rebind happened during the read */
  	do {
  		cpuset_mems_cookie =3D read_mems_allowed_begin();
 -		nnodes =3D read_once_policy_nodemask(pol, &nodes);
 +		nnodes =3D nodes_weight(pol->nodes);
  	} while (read_mems_allowed_retry(cpuset_mems_cookie));
 =20
  	/* if the nodemask has become invalid, we cannot do anything */
@@@ -2691,7 -2660,7 +2691,7 @@@
  	/* Continue allocating from most recent node and adjust the nr_pages */
  	node =3D me->il_prev;
  	weight =3D me->il_weight;
 -	if (weight && node_isset(node, nodes)) {
 +	if (weight && node_isset(node, pol->nodes)) {
  		node_pages =3D min(rem_pages, weight);
  		nr_allocated =3D __alloc_pages_bulk(gfp, node, NULL, node_pages,
  						  page_array);
@@@ -2709,18 -2678,25 +2709,18 @@@
  	me->il_weight =3D 0;
  	prev_node =3D node;
 =20
 -	/* create a local copy of node weights to operate on outside rcu */
 -	weights =3D kmalloc(nr_node_ids, gfp & GFP_RECLAIM_MASK);
 -	if (!weights)
 -		return total_allocated;
 -
 -	rcu_read_lock();
 -	state =3D rcu_dereference(wi_state);
 -	if (state) {
 -		memcpy(weights, state->iw_table, nr_node_ids * sizeof(u8));
 -		rcu_read_unlock();
 -	} else {
 -		rcu_read_unlock();
 -		for (i =3D 0; i < nr_node_ids; i++)
 -			weights[i] =3D 1;
 -	}
 +	/* The page allocator may sleep, pin the weight table with SRCU */
 +	scp =3D srcu_read_lock_fast(&wi_srcu);
 +	state =3D srcu_dereference(wi_state, &wi_srcu);
 +	table =3D state ? state->iw_table : NULL;
 =20
  	/* calculate total, detect system default usage */
 -	for_each_node_mask(node, nodes)
 -		weight_total +=3D weights[node];
 +	for_each_node_mask(node, pol->nodes)
 +		weight_total +=3D table ? table[node] : 1;
 +
 +	/* the mask emptied since it was counted */
 +	if (!weight_total)
 +		goto out;
 =20
  	/*
  	 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
@@@ -2731,15 -2707,11 +2731,15 @@@
  	 */
  	rounds =3D rem_pages / weight_total;
  	delta =3D rem_pages % weight_total;
 -	resume_node =3D next_node_in(prev_node, nodes);
 -	resume_weight =3D weights[resume_node];
 +	resume_node =3D next_node_in(prev_node, pol->nodes);
 +	if (resume_node >=3D MAX_NUMNODES)
 +		goto out;
 +	resume_weight =3D table ? table[resume_node] : 1;
  	for (i =3D 0; i < nnodes; i++) {
 -		node =3D next_node_in(prev_node, nodes);
 -		weight =3D weights[node];
 +		node =3D next_node_in(prev_node, pol->nodes);
 +		if (node >=3D MAX_NUMNODES)
 +			break;
 +		weight =3D table ? table[node] : 1;
  		node_pages =3D weight * rounds;
  		/* If a delta exists, add this node's portion of the delta */
  		if (delta > weight) {
@@@ -2755,8 -2727,6 +2755,8 @@@
  		/* node_pages can be 0 if an allocation fails and rounds =3D=3D 0 */
  		if (!node_pages)
  			break;
 +		/* a rebind can invalidate the counts: never overrun page_array */
 +		node_pages =3D min(node_pages, nr_pages - total_allocated);
  		nr_allocated =3D __alloc_pages_bulk(gfp, node, NULL, node_pages,
  						  page_array);
  		page_array +=3D nr_allocated;
@@@ -2767,8 -2737,7 +2767,8 @@@
  	}
  	me->il_prev =3D resume_node;
  	me->il_weight =3D resume_weight;
 -	kfree(weights);
 +out:
 +	srcu_read_unlock_fast(&wi_srcu, scp);
  	return total_allocated;
  }
 =20
@@@ -3694,7 -3663,10 +3694,7 @@@ static ssize_t node_store(struct kobjec
 =20
  	rcu_assign_pointer(wi_state, new_wi_state);
  	mutex_unlock(&wi_state_lock);
 -	if (old_wi_state) {
 -		synchronize_rcu();
 -		kfree(old_wi_state);
 -	}
 +	wi_state_retire(old_wi_state);
  	return count;
  }
 =20
@@@ -3760,7 -3732,10 +3760,7 @@@ static ssize_t weighted_interleave_auto
  update_wi_state:
  	rcu_assign_pointer(wi_state, new_wi_state);
  	mutex_unlock(&wi_state_lock);
 -	if (old_wi_state) {
 -		synchronize_rcu();
 -		kfree(old_wi_state);
 -	}
 +	wi_state_retire(old_wi_state);
  	return count;
  }
 =20
@@@ -3804,7 -3779,10 +3804,7 @@@ static void wi_state_free(void
  	rcu_assign_pointer(wi_state, NULL);
  	mutex_unlock(&wi_state_lock);
 =20
 -	if (old_wi_state) {
 -		synchronize_rcu();
 -		kfree(old_wi_state);
 -	}
 +	wi_state_retire(old_wi_state);
  }
 =20
  static struct kobj_attribute wi_auto_attr =3D {

--i8Dr5CYepe3zQNsO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqX+AsACgkQJNaLcl1U
h9Dlpgf/fg0RGlOZGIvEtjTtjN00RY4qVMcqJqah0fIx0g05frSk30vtopF3czUY
DrfVVU75A/dY+RD1Y2GKNYShVwz7ZGy3ujeJybR1gtF1zFxHSLypUE88RO+bg2Ne
isBdgtrpIGqimLJmTPi1SyVit02St68jVOwx73l6cvylRzsztsLmSj//3IjMGh5P
lAvj5QP6AI2P796kQ7hMgRPvUB6scNs522TFVgWCjTvtFLkIJ0mSf7yj7/mVILnm
JBqd16rIv1rPGmYQ1yI0EnHTfwW9qi1gp5N3W+3YqIPZmSNESxYrCTIqQmHldy1I
IiQ2YXhYWcuqkKRIszwMUvrhYCpS7Q==
=/dK/
-----END PGP SIGNATURE-----

--i8Dr5CYepe3zQNsO--
