Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926997;
	b=xo4CtT7yKqfWnCYAhMwBVrsHizHr4EgP+Tm218w6rZ8/qNG1uuoMTYv0P0HX7yPs9cRq
	 B+0lqf2fXt3g02bySYWt5nYppJibVuc2Wgkl8eAWeOtTW/DlzYM+pK7ZH2I88qiCTkDgZ
	 /WVBGunLQB/XpcHc9tLQe6VdcI/90VswPBbkNe1diBTv9+Gm27wf+SPdyWHmj9/3Uwec2
	 LMAOwkYmP4oEriaUKBqK8vPmr4R1pahsQfCCNLC1buzoRvqwEyG1j4YEjT1K/c+WRk8JW
	 RQE31Zo2RotGSS14kgPNdqXar9Bm6FIyNJpcUIZJO8aGJlsMPKte61LNGhPbqHKHvAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926997;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=3o9h3Zh+h/3iTOpn42I1kBkaWKwpibcJ5c5VnBcbeD0=;
	b=Sjf2EpBUEOTtwRy+lyOMgd32uSENqQfzOdSEaErreOCSbRn7l+IY09GPZ0dMH0II/HOD
	 IDDNE8WkyartZusrvOk9IOHYydG4QuBNHBTC/SThZK1RkynJcYPpoXs0n543IBVMWHMWX
	 6GPeLXKjC34AuqAnBZNeo5BADniRQOktuUhHdd9gI06SFhsaUW54KoUP93MElirSxogOE
	 luvdrQVp/e53Dm4UhFXjEZnGOrqK9dR35Qj46MiuPHfb1gfsP0/XECea1OD0yngK4Isgm
	 iHHZZp/PDhtPQs85V4wG0Vrz89japRVnWvf+whSq3Yrzglv/RlY7wyxsVx2uq3k4xew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PpX//LxV";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE62B606A323;
	Tue, 17 Nov 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpX//LxV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A421F000C9;
	Tue, 17 Nov 2026 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794926997;
	bh=3o9h3Zh+h/3iTOpn42I1kBkaWKwpibcJ5c5VnBcbeD0=;
	h=Date:From:To:Cc:Subject;
	b=PpX//LxVdnWH2HDoZ9jrLKyY2zgHX7ll/RAbCbvWMzaIlYFLLX7Qu1PxiFAzjBsMK
	 0Zc9CdoYfCpGqkgFbSXEjM1qIguTiTeS7uKJK/zfWD5iTcJ4C71+FmrcYHUN6/tgC0
	 Dr3c61b0EhCobXJ9HBttn5sHUXLMvYuimK4KAlYhs+Bx/RGnEZ7ol3uIufHP76RUpW
	 1y6wvCGHhZnmxvupqEhTxt6Hg3MZaJBORgrPdFU5hcD0zQJCzHUa2TvHHQ/F7tVKFA
	 hs2C6JKPJnwCH4dLdgugcqOy3STWua0HwMIqIaPIU0bGmNhvomboRc+tqnGm+MY5fK
	 JSiYwsaXUH5Xw==
Date: Tue, 17 Nov 2026 14:49:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Daehyeon Ko <4ncienth@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-fixes tree with the origin tree
Message-ID: <avxpkXiyWwLqqAuu@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qJyN0fTmoIFKO5F1"
Content-Disposition: inline


--qJyN0fTmoIFKO5F1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-fixes tree got a conflict in:

  lib/assoc_array.c

between commits:

  2dafc9bc491da ("assoc_array: find and collapse in deletion without gotos")
  4a5db94ad9b76 ("assoc_array: move deletion's collapse into a function of =
its own")

=66rom the origin tree and commit:

  37ff457ec4679 ("assoc_array: discard shortcut when collapsing a leaf-only=
 node")

=66rom the mm-fixes tree.  My fix below just drops Daeheyon's patch which
I don't think is the correct resolution but I have never looked at this
code before and do not rate my chances of doing a correct merge without
testing in the time available.  The code he modified moves into the new
assoc_array_delete_collapse() function but not quite simiarly enough.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined lib/assoc_array.c
index f19888ec3e093,841dfe07dc962..0000000000000
--- a/lib/assoc_array.c
+++ b/lib/assoc_array.c
@@@ -470,32 -470,33 +470,32 @@@ static bool assoc_array_insert_in_empty
  }
 =20
  /*
 - * Handle insertion into a terminal node.
 + * The pointer that leads to a node or shortcut with the given back point=
er
 + * and parent slot: the root, a slot in a node, or a shortcut's next node.
   */
 -static bool assoc_array_insert_into_terminal_node(struct assoc_array_edit=
 *edit,
 -						  const struct assoc_array_ops *ops,
 -						  const void *index_key,
 -						  struct assoc_array_walk_result *result)
 +static struct assoc_array_ptr **assoc_array_parent_link(struct assoc_arra=
y *array,
 +							struct assoc_array_ptr *back_pointer,
 +							int parent_slot)
 +{
 +	if (!back_pointer)
 +		return &array->root;
 +	if (assoc_array_ptr_is_node(back_pointer))
 +		return &assoc_array_ptr_to_node(back_pointer)->slots[parent_slot];
 +	return &assoc_array_ptr_to_shortcut(back_pointer)->next_node;
 +}
 +
 +/*
 + * Insert into a terminal node without changing its shape, if that can be
 + * done: in place of a leaf with the same index key, or in a free slot.
 + */
 +static bool assoc_array_insert_in_node(struct assoc_array_edit *edit,
 +				       const struct assoc_array_ops *ops,
 +				       const void *index_key,
 +				       struct assoc_array_node *node)
  {
 -	struct assoc_array_shortcut *shortcut, *new_s0;
 -	struct assoc_array_node *node, *new_n0, *new_n1, *side;
  	struct assoc_array_ptr *ptr;
 -	unsigned long dissimilarity, base_seg, blank;
 -	size_t keylen;
 -	bool have_meta;
 -	int level, diff;
 -	int slot, next_slot, free_slot, i, j;
 +	int free_slot, i;
 =20
 -	node	=3D result->terminal_node.node;
 -	level	=3D result->terminal_node.level;
 -	edit->segment_cache[ASSOC_ARRAY_FAN_OUT] =3D result->terminal_node.slot;
 -
 -	pr_devel("-->%s()\n", __func__);
 -
 -	/* We arrived at a node which doesn't have an onward node or shortcut
 -	 * pointer that we have to follow.  This means that (a) the leaf we
 -	 * want must go here (either by insertion or replacement) or (b) we
 -	 * need to split this node and insert in one of the fragments.
 -	 */
  	free_slot =3D -1;
 =20
  	/* Firstly, we have to check the leaves in this node to see if there's
@@@ -513,6 -514,7 +513,6 @@@
  			pr_devel("replace in slot %d\n", i);
  			edit->leaf_p =3D &node->slots[i];
  			edit->dead_leaf =3D node->slots[i];
 -			pr_devel("<--%s() =3D ok [replace]\n", __func__);
  			return true;
  		}
  	}
@@@ -524,28 -526,28 +524,28 @@@
  		pr_devel("insert in free slot %d\n", free_slot);
  		edit->leaf_p =3D &node->slots[free_slot];
  		edit->adjust_count_on =3D node;
 -		pr_devel("<--%s() =3D ok [insert]\n", __func__);
  		return true;
  	}
 =20
 -	/* The node has no spare slots - so we're either going to have to split
 -	 * it or insert another node before it.
 -	 *
 -	 * Whatever, we're going to need at least two new nodes - so allocate
 -	 * those now.  We may also need a new shortcut, but we deal with that
 -	 * when we need it.
 -	 */
 -	new_n0 =3D kzalloc_obj(struct assoc_array_node);
 -	if (!new_n0)
 -		return false;
 -	edit->new_meta[0] =3D assoc_array_node_to_ptr(new_n0);
 -	new_n1 =3D kzalloc_obj(struct assoc_array_node);
 -	if (!new_n1)
 -		return false;
 -	edit->new_meta[1] =3D assoc_array_node_to_ptr(new_n1);
 +	return false;
 +}
 +
 +/*
 + * Fill in the edit script's segment cache for a full node: the segment at
 + * this level of each leaf's index key, or 0xff for a metadata pointer.
 + * The new key's segment, in the last entry, is left to the caller.  Retu=
rns
 + * true if there are any metadata pointers.
 + */
 +static bool assoc_array_fill_segment_cache(struct assoc_array_edit *edit,
 +					   const struct assoc_array_ops *ops,
 +					   const struct assoc_array_node *node,
 +					   int level)
 +{
 +	struct assoc_array_ptr *ptr;
 +	unsigned long base_seg;
 +	bool have_meta;
 +	int i;
 =20
 -	/* We need to find out how similar the leaves are. */
 -	pr_devel("no spare slots\n");
  	have_meta =3D false;
  	for (i =3D 0; i < ASSOC_ARRAY_FAN_OUT; i++) {
  		ptr =3D node->slots[i];
@@@ -559,42 -561,65 +559,42 @@@
  		base_seg >>=3D level & ASSOC_ARRAY_KEY_CHUNK_MASK;
  		edit->segment_cache[i] =3D base_seg & ASSOC_ARRAY_FAN_MASK;
  	}
 +	return have_meta;
 +}
 =20
 -	if (have_meta) {
 -		pr_devel("have meta\n");
 -		goto split_node;
 -	}
 +/*
 + * Whether the leaves of a full node and the new key all share one segmen=
t,
 + * so that splitting the node cannot make room.
 + */
 +static bool assoc_array_all_one_segment(const struct assoc_array_edit *ed=
it)
 +{
 +	int i;
 =20
 -	/* The node contains only leaves */
 -	dissimilarity =3D 0;
 -	base_seg =3D edit->segment_cache[0];
 -	for (i =3D 1; i < ASSOC_ARRAY_FAN_OUT; i++)
 -		dissimilarity |=3D edit->segment_cache[i] ^ base_seg;
 +	for (i =3D 1; i < ASSOC_ARRAY_FAN_OUT + 1; i++)
 +		if (edit->segment_cache[i] !=3D edit->segment_cache[0])
 +			return false;
 +	return true;
 +}
 =20
 -	pr_devel("only leaves; dissimilarity=3D%lx\n", dissimilarity);
 +/*
 + * Split a full node into new_n0, which takes its place, and new_n1, below
 + * new_n0 in the slot of a segment that at least two of the leaves share,
 + * the new one included.  The caller has filled in the segment cache and
 + * set new_n0's back pointer and parent slot.
 + */
 +static void assoc_array_split_node(struct assoc_array_edit *edit,
 +				   struct assoc_array_node *node,
 +				   struct assoc_array_node *new_n0,
 +				   struct assoc_array_node *new_n1)
 +{
 +	struct assoc_array_shortcut *shortcut;
 +	struct assoc_array_node *side;
 +	struct assoc_array_ptr *ptr;
 +	int slot, next_slot, free_slot, i, j;
 =20
 -	if ((dissimilarity & ASSOC_ARRAY_FAN_MASK) =3D=3D 0) {
 -		/* The old leaves all cluster in the same slot.  We will need
 -		 * to insert a shortcut if the new node wants to cluster with them.
 -		 */
 -		if ((edit->segment_cache[ASSOC_ARRAY_FAN_OUT] ^ base_seg) =3D=3D 0)
 -			goto all_leaves_cluster_together;
 -
 -		/* Otherwise all the old leaves cluster in the same slot, but
 -		 * the new leaf wants to go into a different slot - so we
 -		 * create a new node (n0) to hold the new leaf and a pointer to
 -		 * a new node (n1) holding all the old leaves.
 -		 *
 -		 * This can be done by falling through to the node splitting
 -		 * path.
 -		 */
 -		pr_devel("present leaves cluster but not new leaf\n");
 -	}
 -
 -split_node:
  	pr_devel("split node\n");
 =20
 -	/* We need to split the current node.  The node must contain anything
 -	 * from a single leaf (in the one leaf case, this leaf will cluster
 -	 * with the new leaf) and the rest meta-pointers, to all leaves, some
 -	 * of which may cluster.
 -	 *
 -	 * It won't contain the case in which all the current leaves plus the
 -	 * new leaves want to cluster in the same slot.
 -	 *
 -	 * We need to expel at least two leaves out of a set consisting of the
 -	 * leaves in the node and the new leaf.  The current meta pointers can
 -	 * just be copied as they shouldn't cluster with any of the leaves.
 -	 *
 -	 * We need a new node (n0) to replace the current one and a new node to
 -	 * take the expelled nodes (n1).
 -	 */
 -	edit->set[0].to =3D assoc_array_node_to_ptr(new_n0);
 -	new_n0->back_pointer =3D node->back_pointer;
 -	new_n0->parent_slot =3D node->parent_slot;
  	new_n1->back_pointer =3D assoc_array_node_to_ptr(new_n0);
 -	new_n1->parent_slot =3D -1; /* Need to calculate this */
 -
 -do_split_node:
 -	pr_devel("do_split_node\n");
 -
  	new_n0->nr_leaves_on_branch =3D node->nr_leaves_on_branch;
  	new_n1->nr_leaves_on_branch =3D 0;
 =20
@@@ -674,29 -699,26 +674,29 @@@ found_slot_for_multiple_occupancy
  			}
  		}
  	}
 +}
 =20
 -	ptr =3D node->back_pointer;
 -	if (!ptr)
 -		edit->set[0].ptr =3D &edit->array->root;
 -	else if (assoc_array_ptr_is_node(ptr))
 -		edit->set[0].ptr =3D &assoc_array_ptr_to_node(ptr)->slots[node->parent_=
slot];
 -	else
 -		edit->set[0].ptr =3D &assoc_array_ptr_to_shortcut(ptr)->next_node;
 -	edit->excised_meta[0] =3D assoc_array_node_to_ptr(node);
 -	pr_devel("<--%s() =3D ok [split node]\n", __func__);
 -	return true;
 +/*
 + * All the leaves, new and old, want to cluster together in this node in =
the
 + * same slot, so we have to replace this node with a shortcut to skip over
 + * the identical parts of the key, leading to new_n0.  If the node is the
 + * target of a shortcut, the new one replaces that shortcut as well.  The
 + * caller then splits the leaves between new_n0 and new_n1 at the shortcu=
t's
 + * far end, for which this fills in the segment cache.
 + */
 +static struct assoc_array_shortcut *
 +assoc_array_insert_shortcut(struct assoc_array_edit *edit,
 +			    const struct assoc_array_ops *ops,
 +			    const void *index_key,
 +			    struct assoc_array_node *node, int level,
 +			    struct assoc_array_node *new_n0)
 +{
 +	struct assoc_array_shortcut *new_s0;
 +	unsigned long base_seg, blank;
 +	size_t keylen;
 +	int diff, i;
 =20
 -all_leaves_cluster_together:
 -	/* All the leaves, new and old, want to cluster together in this node
 -	 * in the same slot, so we have to replace this node with a shortcut to
 -	 * skip over the identical parts of the key and then place a pair of
 -	 * nodes, one inside the other, at the end of the shortcut and
 -	 * distribute the keys between them.
 -	 *
 -	 * Firstly we need to work out where the leaves start diverging as a
 +	/* Firstly we need to work out where the leaves start diverging as a
  	 * bit position into their keys so that we know how big the shortcut
  	 * needs to be.
  	 *
@@@ -722,28 -744,17 +722,28 @@@
 =20
  	new_s0 =3D kzalloc_flex(*new_s0, index_key, keylen);
  	if (!new_s0)
 -		return false;
 +		return NULL;
  	edit->new_meta[2] =3D assoc_array_shortcut_to_ptr(new_s0);
 =20
 -	edit->set[0].to =3D assoc_array_shortcut_to_ptr(new_s0);
  	new_s0->back_pointer =3D node->back_pointer;
  	new_s0->parent_slot =3D node->parent_slot;
 +
 +	/* A shortcut has to lead to a node, so a node at the end of a shortcut
 +	 * is replaced together with that shortcut.  The new one holds the index
 +	 * key from the root, so it covers what the old one did.
 +	 */
 +	if (node->back_pointer &&
 +	    assoc_array_ptr_is_shortcut(node->back_pointer)) {
 +		struct assoc_array_shortcut *above =3D
 +			assoc_array_ptr_to_shortcut(node->back_pointer);
 +
 +		new_s0->back_pointer =3D above->back_pointer;
 +		new_s0->parent_slot =3D above->parent_slot;
 +		edit->excised_meta[1] =3D node->back_pointer;
 +	}
  	new_s0->next_node =3D assoc_array_node_to_ptr(new_n0);
  	new_n0->back_pointer =3D assoc_array_shortcut_to_ptr(new_s0);
  	new_n0->parent_slot =3D 0;
 -	new_n1->back_pointer =3D assoc_array_node_to_ptr(new_n0);
 -	new_n1->parent_slot =3D -1; /* Need to calculate this */
 =20
  	new_s0->skip_to_level =3D level =3D diff & ~ASSOC_ARRAY_LEVEL_STEP_MASK;
  	pr_devel("skip_to_level =3D %d [diff %d]\n", level, diff);
@@@ -762,104 -773,18 +762,104 @@@
  	/* This now reduces to a node splitting exercise for which we'll need
  	 * to regenerate the disparity table.
  	 */
 -	for (i =3D 0; i < ASSOC_ARRAY_FAN_OUT; i++) {
 -		ptr =3D node->slots[i];
 -		base_seg =3D ops->get_object_key_chunk(assoc_array_ptr_to_leaf(ptr),
 -						     level);
 -		base_seg >>=3D level & ASSOC_ARRAY_KEY_CHUNK_MASK;
 -		edit->segment_cache[i] =3D base_seg & ASSOC_ARRAY_FAN_MASK;
 -	}
 -
 +	assoc_array_fill_segment_cache(edit, ops, node, level);
  	base_seg =3D ops->get_key_chunk(index_key, level);
  	base_seg >>=3D level & ASSOC_ARRAY_KEY_CHUNK_MASK;
  	edit->segment_cache[ASSOC_ARRAY_FAN_OUT] =3D base_seg & ASSOC_ARRAY_FAN_=
MASK;
 -	goto do_split_node;
 +	return new_s0;
 +}
 +
 +/*
 + * Handle insertion into a terminal node.
 + */
 +static bool assoc_array_insert_into_terminal_node(struct assoc_array_edit=
 *edit,
 +						  const struct assoc_array_ops *ops,
 +						  const void *index_key,
 +						  struct assoc_array_walk_result *result)
 +{
 +	struct assoc_array_shortcut *new_s0;
 +	struct assoc_array_node *node, *new_n0, *new_n1;
 +	bool have_meta;
 +	int level;
 +
 +	node	=3D result->terminal_node.node;
 +	level	=3D result->terminal_node.level;
 +
 +	pr_devel("-->%s()\n", __func__);
 +
 +	/* We arrived at a node which doesn't have an onward node or shortcut
 +	 * pointer that we have to follow.  This means that (a) the leaf we
 +	 * want must go here (either by insertion or replacement) or (b) we
 +	 * need to split this node and insert in one of the fragments.
 +	 */
 +	if (assoc_array_insert_in_node(edit, ops, index_key, node)) {
 +		pr_devel("<--%s() =3D ok [in node]\n", __func__);
 +		return true;
 +	}
 +
 +	/* The node has no spare slots - so we're either going to have to split
 +	 * it or insert another node before it.
 +	 *
 +	 * Whatever, we're going to need at least two new nodes - so allocate
 +	 * those now.  We may also need a new shortcut, but we deal with that
 +	 * when we need it.
 +	 */
 +	new_n0 =3D kzalloc_obj(struct assoc_array_node);
 +	if (!new_n0)
 +		return false;
 +	edit->new_meta[0] =3D assoc_array_node_to_ptr(new_n0);
 +	new_n1 =3D kzalloc_obj(struct assoc_array_node);
 +	if (!new_n1)
 +		return false;
 +	edit->new_meta[1] =3D assoc_array_node_to_ptr(new_n1);
 +
 +	/* We need to find out how similar the leaves are. */
 +	pr_devel("no spare slots\n");
 +	have_meta =3D assoc_array_fill_segment_cache(edit, ops, node, level);
 +	edit->segment_cache[ASSOC_ARRAY_FAN_OUT] =3D result->terminal_node.slot;
 +
 +	if (!have_meta && assoc_array_all_one_segment(edit)) {
 +		/* The node only contains leaves and all the leaves cluster in
 +		 * the same slot, so we need to insert a shortcut to skip the
 +		 * common portion of the key and split the node at the
 +		 * shortcut's far end.  The shortcut goes wherever its back
 +		 * pointer says, which may be further up than the node.
 +		 */
 +		new_s0 =3D assoc_array_insert_shortcut(edit, ops, index_key,
 +						     node, level, new_n0);
 +		if (!new_s0)
 +			return false;
 +		edit->set[0].ptr =3D assoc_array_parent_link(edit->array,
 +							   new_s0->back_pointer,
 +							   new_s0->parent_slot);
 +		edit->set[0].to =3D assoc_array_shortcut_to_ptr(new_s0);
 +	} else {
 +		/* We need to split the current node.  The node must contain
 +		 * anything from a single leaf (in the one leaf case, this leaf
 +		 * will cluster with the new leaf) and the rest meta-pointers,
 +		 * to all leaves, some of which may cluster.
 +		 *
 +		 * We need to expel at least two leaves out of a set consisting
 +		 * of the leaves in the node and the new leaf.  The current meta
 +		 * pointers can just be copied as they shouldn't cluster with
 +		 * any of the leaves.  If all the old leaves cluster in one slot
 +		 * and the new leaf does not, they all go and the new leaf stays.
 +		 *
 +		 * We need a new node (n0) to replace the current one and a new
 +		 * node to take the expelled nodes (n1).
 +		 */
 +		new_n0->back_pointer =3D node->back_pointer;
 +		new_n0->parent_slot =3D node->parent_slot;
 +		edit->set[0].ptr =3D assoc_array_parent_link(edit->array,
 +							   new_n0->back_pointer,
 +							   new_n0->parent_slot);
 +		edit->set[0].to =3D assoc_array_node_to_ptr(new_n0);
 +	}
 +
 +	assoc_array_split_node(edit, node, new_n0, new_n1);
 +	edit->excised_meta[0] =3D assoc_array_node_to_ptr(node);
 +	pr_devel("<--%s() =3D ok [split node]\n", __func__);
 +	return true;
  }
 =20
  /*
@@@ -870,7 -795,7 +870,7 @@@ static bool assoc_array_insert_mid_shor
  					    struct assoc_array_walk_result *result)
  {
  	struct assoc_array_shortcut *shortcut, *new_s0, *new_s1;
 -	struct assoc_array_node *node, *new_n0, *side;
 +	struct assoc_array_node *new_n0, *side;
  	unsigned long sc_segments, dissimilarity, blank;
  	size_t keylen;
  	int level, sc_level, diff;
@@@ -896,11 -821,14 +896,11 @@@
  	diff +=3D sc_level & ~ASSOC_ARRAY_KEY_CHUNK_MASK;
  	pr_devel("diff=3D%d\n", diff);
 =20
 -	if (!shortcut->back_pointer) {
 -		edit->set[0].ptr =3D &edit->array->root;
 -	} else if (assoc_array_ptr_is_node(shortcut->back_pointer)) {
 -		node =3D assoc_array_ptr_to_node(shortcut->back_pointer);
 -		edit->set[0].ptr =3D &node->slots[shortcut->parent_slot];
 -	} else {
 -		BUG();
 -	}
 +	BUG_ON(shortcut->back_pointer &&
 +	       !assoc_array_ptr_is_node(shortcut->back_pointer));
 +	edit->set[0].ptr =3D assoc_array_parent_link(edit->array,
 +						   shortcut->back_pointer,
 +						   shortcut->parent_slot);
 =20
  	edit->excised_meta[0] =3D assoc_array_shortcut_to_ptr(shortcut);
 =20
@@@ -915,8 -843,7 +915,8 @@@
  	 * zero length - otherwise we just connect the new node directly to the
  	 * parent.
  	 */
 -	level +=3D ASSOC_ARRAY_LEVEL_STEP;
 +	if (shortcut->back_pointer)
 +		level +=3D ASSOC_ARRAY_LEVEL_STEP;
  	if (diff > level) {
  		pr_devel("pre-shortcut %d...%d\n", level, diff);
  		keylen =3D round_up(diff, ASSOC_ARRAY_KEY_CHUNK_SIZE);
@@@ -938,11 -865,9 +938,11 @@@
  		memcpy(new_s0->index_key, shortcut->index_key,
  		       flex_array_size(new_s0, index_key, keylen));
 =20
 -		blank =3D ULONG_MAX << (diff & ASSOC_ARRAY_KEY_CHUNK_MASK);
 -		pr_devel("blank off [%zu] %d: %lx\n", keylen - 1, diff, blank);
 -		new_s0->index_key[keylen - 1] &=3D ~blank;
 +		if (diff & ASSOC_ARRAY_KEY_CHUNK_MASK) {
 +			blank =3D ULONG_MAX << (diff & ASSOC_ARRAY_KEY_CHUNK_MASK);
 +			pr_devel("blank off [%zu] %d: %lx\n", keylen - 1, diff, blank);
 +			new_s0->index_key[keylen - 1] &=3D ~blank;
 +		}
  	} else {
  		pr_devel("no pre-shortcut\n");
  		edit->set[0].to =3D assoc_array_node_to_ptr(new_n0);
@@@ -1130,92 -1055,6 +1130,92 @@@ static int assoc_array_delete_collapse_
  	return 0;
  }
 =20
 +/*
 + * Deleting a leaf from node leaves its subtree with FAN_OUT or fewer lea=
ves:
 + * collapse the subtree into one new node, together with as much of the t=
ree
 + * above it as also fits.  Returns false if the new node cannot be alloca=
ted.
 + */
 +static bool assoc_array_delete_collapse(struct assoc_array_edit *edit,
 +					struct assoc_array_node *node)
 +{
 +	struct assoc_array_delete_collapse_context collapse;
 +	struct assoc_array_node *parent, *grandparent, *new_n0;
 +	struct assoc_array_ptr *ptr;
 +	bool has_meta;
 +	int i;
 +
 +	/* First of all, we need to know if this node has metadata so
 +	 * that we don't try collapsing if all the leaves are already
 +	 * here.
 +	 */
 +	has_meta =3D false;
 +	for (i =3D 0; i < ASSOC_ARRAY_FAN_OUT; i++) {
 +		ptr =3D node->slots[i];
 +		if (assoc_array_ptr_is_meta(ptr)) {
 +			has_meta =3D true;
 +			break;
 +		}
 +	}
 +
 +	pr_devel("leaves: %ld [m=3D%d]\n",
 +		 node->nr_leaves_on_branch - 1, has_meta);
 +
 +	/* Look further up the tree to see if we can collapse this node
 +	 * into a more proximal node too.
 +	 */
 +	for (parent =3D node;; parent =3D grandparent) {
 +		pr_devel("collapse subtree: %ld\n", parent->nr_leaves_on_branch);
 +
 +		ptr =3D parent->back_pointer;
 +		if (ptr && assoc_array_ptr_is_shortcut(ptr))
 +			ptr =3D assoc_array_ptr_to_shortcut(ptr)->back_pointer;
 +		if (!ptr)
 +			break;
 +
 +		grandparent =3D assoc_array_ptr_to_node(ptr);
 +		if (grandparent->nr_leaves_on_branch > ASSOC_ARRAY_FAN_OUT + 1)
 +			break;
 +	}
 +
 +	/* There's no point collapsing if the original node has no meta
 +	 * pointers to discard and if we didn't merge into one of that
 +	 * node's ancestry.
 +	 */
 +	if (has_meta || parent !=3D node) {
 +		node =3D parent;
 +
 +		/* Create a new node to collapse into */
 +		new_n0 =3D kzalloc_obj(struct assoc_array_node);
 +		if (!new_n0)
 +			return false;
 +		edit->new_meta[0] =3D assoc_array_node_to_ptr(new_n0);
 +
 +		new_n0->back_pointer =3D node->back_pointer;
 +		new_n0->parent_slot =3D node->parent_slot;
 +		new_n0->nr_leaves_on_branch =3D node->nr_leaves_on_branch;
 +		edit->adjust_count_on =3D new_n0;
 +
 +		collapse.node =3D new_n0;
 +		collapse.skip_leaf =3D assoc_array_ptr_to_leaf(edit->dead_leaf);
 +		collapse.slot =3D 0;
 +		assoc_array_subtree_iterate(assoc_array_node_to_ptr(node),
 +					    node->back_pointer,
 +					    assoc_array_delete_collapse_iterator,
 +					    &collapse);
 +		pr_devel("collapsed %d,%lu\n", collapse.slot, new_n0->nr_leaves_on_bran=
ch);
 +		BUG_ON(collapse.slot !=3D new_n0->nr_leaves_on_branch - 1);
 +
 +		BUG_ON(node->back_pointer &&
 +		       assoc_array_ptr_is_leaf(node->back_pointer));
 +		edit->set[1].ptr =3D assoc_array_parent_link(edit->array,
 +							   node->back_pointer,
 +							   node->parent_slot);
 +		edit->set[1].to =3D assoc_array_node_to_ptr(new_n0);
 +		edit->excised_subtree =3D assoc_array_node_to_ptr(node);
 +	}
 +	return true;
 +}
 +
  /**
   * assoc_array_delete - Script deletion of an object from an associative =
array
   * @array: The array to search.
@@@ -1239,11 -1078,13 +1239,11 @@@ struct assoc_array_edit *assoc_array_de
  					    const struct assoc_array_ops *ops,
  					    const void *index_key)
  {
 -	struct assoc_array_delete_collapse_context collapse;
  	struct assoc_array_walk_result result;
 -	struct assoc_array_node *node, *new_n0;
 +	struct assoc_array_node *node;
  	struct assoc_array_edit *edit;
  	struct assoc_array_ptr *ptr;
 -	bool has_meta;
 -	int slot, i;
 +	int slot;
 =20
  	pr_devel("-->%s()\n", __func__);
 =20
@@@ -1254,10 -1095,8 +1254,10 @@@
  	edit->ops =3D ops;
  	edit->adjust_count_by =3D -1;
 =20
 -	switch (assoc_array_walk(array, ops, index_key, &result)) {
 -	case assoc_array_walk_found_terminal_node:
 +	node =3D NULL;
 +	slot =3D ASSOC_ARRAY_FAN_OUT;
 +	if (assoc_array_walk(array, ops, index_key, &result) =3D=3D
 +	    assoc_array_walk_found_terminal_node) {
  		/* We found a node that should contain the leaf we've been
  		 * asked to remove - *if* it's in the tree.
  		 */
@@@ -1270,15 -1109,18 +1270,15 @@@
  			    assoc_array_ptr_is_leaf(ptr) &&
  			    ops->compare_object(assoc_array_ptr_to_leaf(ptr),
  						index_key))
 -				goto found_leaf;
 +				break;
  		}
 -		fallthrough;
 -	case assoc_array_walk_tree_empty:
 -	case assoc_array_walk_found_wrong_shortcut:
 -	default:
 +	}
 +	if (slot =3D=3D ASSOC_ARRAY_FAN_OUT) {
  		assoc_array_cancel_edit(edit);
  		pr_devel("not found\n");
  		return NULL;
  	}
 =20
 -found_leaf:
  	BUG_ON(array->nr_leaves_on_tree <=3D 0);
 =20
  	/* In the simplest form of deletion we just clear the slot and release
@@@ -1311,15 -1153,111 +1311,15 @@@
  	 * We could also try and collapse in partially filled subtrees to take
  	 * up space in this node.
  	 */
 -	if (node->nr_leaves_on_branch <=3D ASSOC_ARRAY_FAN_OUT + 1) {
 -		struct assoc_array_node *parent, *grandparent;
 -		struct assoc_array_ptr *ptr;
 -
 -		/* First of all, we need to know if this node has metadata so
 -		 * that we don't try collapsing if all the leaves are already
 -		 * here.
 -		 */
 -		has_meta =3D false;
 -		for (i =3D 0; i < ASSOC_ARRAY_FAN_OUT; i++) {
 -			ptr =3D node->slots[i];
 -			if (assoc_array_ptr_is_meta(ptr)) {
 -				has_meta =3D true;
 -				break;
 -			}
 -		}
 -
 -		pr_devel("leaves: %ld [m=3D%d]\n",
 -			 node->nr_leaves_on_branch - 1, has_meta);
 -
 -		/* Look further up the tree to see if we can collapse this node
 -		 * into a more proximal node too.
 -		 */
 -		parent =3D node;
 -	collapse_up:
 -		pr_devel("collapse subtree: %ld\n", parent->nr_leaves_on_branch);
 -
 -		ptr =3D parent->back_pointer;
 -		if (!ptr)
 -			goto do_collapse;
 -		if (assoc_array_ptr_is_shortcut(ptr)) {
 -			struct assoc_array_shortcut *s =3D assoc_array_ptr_to_shortcut(ptr);
 -			ptr =3D s->back_pointer;
 -			if (!ptr)
 -				goto do_collapse;
 -		}
 -
 -		grandparent =3D assoc_array_ptr_to_node(ptr);
 -		if (grandparent->nr_leaves_on_branch <=3D ASSOC_ARRAY_FAN_OUT + 1) {
 -			parent =3D grandparent;
 -			goto collapse_up;
 -		}
 -
 -	do_collapse:
 -		/* There's no point collapsing if the original node has no meta
 -		 * pointers to discard and if we didn't merge into one of that
 -		 * node's ancestry.
 -		 */
 -		if (has_meta || parent !=3D node) {
 -			node =3D parent;
 -
 -			/* Create a new node to collapse into */
 -			new_n0 =3D kzalloc_obj(struct assoc_array_node);
 -			if (!new_n0)
 -				goto enomem;
 -			edit->new_meta[0] =3D assoc_array_node_to_ptr(new_n0);
 -
 -			/* A shortcut above a leaf-only node is redundant.  Drop it as
 -			 * GC does so that a later split can't create two shortcuts in a row.
 -			 */
 -			ptr =3D node->back_pointer;
 -			if (assoc_array_ptr_is_shortcut(ptr)) {
 -				struct assoc_array_shortcut *s =3D
 -					assoc_array_ptr_to_shortcut(ptr);
 -
 -				new_n0->back_pointer =3D s->back_pointer;
 -				new_n0->parent_slot =3D s->parent_slot;
 -				edit->excised_subtree =3D ptr;
 -			} else {
 -				new_n0->back_pointer =3D ptr;
 -				new_n0->parent_slot =3D node->parent_slot;
 -				edit->excised_subtree =3D assoc_array_node_to_ptr(node);
 -			}
 -			new_n0->nr_leaves_on_branch =3D node->nr_leaves_on_branch;
 -			edit->adjust_count_on =3D new_n0;
 -
 -			collapse.node =3D new_n0;
 -			collapse.skip_leaf =3D assoc_array_ptr_to_leaf(edit->dead_leaf);
 -			collapse.slot =3D 0;
 -			assoc_array_subtree_iterate(assoc_array_node_to_ptr(node),
 -						    node->back_pointer,
 -						    assoc_array_delete_collapse_iterator,
 -						    &collapse);
 -			pr_devel("collapsed %d,%lu\n", collapse.slot, new_n0->nr_leaves_on_bra=
nch);
 -			BUG_ON(collapse.slot !=3D new_n0->nr_leaves_on_branch - 1);
 -
 -			if (!new_n0->back_pointer) {
 -				edit->set[1].ptr =3D &array->root;
 -			} else {
 -				struct assoc_array_node *p;
 -
 -				p =3D assoc_array_ptr_to_node(new_n0->back_pointer);
 -				edit->set[1].ptr =3D &p->slots[new_n0->parent_slot];
 -			}
 -			edit->set[1].to =3D assoc_array_node_to_ptr(new_n0);
 -		}
 +	if (node->nr_leaves_on_branch <=3D ASSOC_ARRAY_FAN_OUT + 1 &&
 +	    !assoc_array_delete_collapse(edit, node)) {
 +		/* Clean up after an out of memory error */
 +		pr_devel("enomem\n");
 +		assoc_array_cancel_edit(edit);
 +		return ERR_PTR(-ENOMEM);
  	}
 =20
  	return edit;
 -
 -enomem:
 -	/* Clean up after an out of memory error */
 -	pr_devel("enomem\n");
 -	assoc_array_cancel_edit(edit);
 -	return ERR_PTR(-ENOMEM);
  }
 =20
  /**
@@@ -1495,115 -1433,115 +1495,115 @@@ void assoc_array_cancel_edit(struct a=
ss
  	kfree(edit);
  }
 =20
 -/**
 - * assoc_array_gc - Garbage collect an associative array.
 - * @array: The array to clean.
 - * @ops: The operations to use.
 - * @iterator: A callback function to pass judgement on each object.
 - * @iterator_data: Private data for the callback function.
 - *
 - * Collect garbage from an associative array and pack down the internal t=
ree to
 - * save memory.
 - *
 - * The iterator function is asked to pass judgement upon each object in t=
he
 - * array.  If it returns false, the object is discard and if it returns t=
rue,
 - * the object is kept.  If it returns true, it must increment the object's
 - * usage count (or whatever it needs to do to retain it) before returning.
 - *
 - * This function returns 0 if successful or -ENOMEM if out of memory.  In=
 the
 - * latter case, the array is not changed.
 - *
 - * The caller should lock against other modifications and must continue t=
o hold
 - * the lock until assoc_array_apply_edit() has been called.
 - *
 - * Accesses to the tree may take place concurrently with this function,
 - * provided they hold the RCU read lock.
 +/*
 + * Where assoc_array_gc() has got to.  It copies the tree depth first wit=
hout
 + * recursion: on reaching a subtree it copies it and carries on there, an=
d on
 + * finishing a node it climbs back up the old tree to the node above.
   */
 -int assoc_array_gc(struct assoc_array *array,
 -		   const struct assoc_array_ops *ops,
 -		   bool (*iterator)(void *object, void *iterator_data),
 -		   void *iterator_data)
 +struct assoc_array_gc_walk {
 +	struct assoc_array_node	*node;		/* The node being copied */
 +	struct assoc_array_node	*new_n;		/* Its copy */
 +	int			slot;		/* The next slot of node to look at */
 +	struct assoc_array_ptr	*new_root;	/* The root of the copy */
 +	unsigned long		nr_leaves_on_tree;
 +	bool (*iterator)(void *object, void *iterator_data);
 +	void			*iterator_data;
 +};
 +
 +/*
 + * Copy the node at cursor, and the shortcut in front of it if there is o=
ne,
 + * into the new tree at *link, below the copy of the node being worked on,
 + * and work on that node next.
 + */
 +static bool assoc_array_gc_copy(struct assoc_array_gc_walk *w,
 +				struct assoc_array_ptr *cursor,
 +				struct assoc_array_ptr **link)
  {
  	struct assoc_array_shortcut *shortcut, *new_s;
 -	struct assoc_array_node *node, *new_n;
 -	struct assoc_array_edit *edit;
 -	struct assoc_array_ptr *cursor, *ptr;
 -	struct assoc_array_ptr *new_root, *new_parent, **new_ptr_pp;
 -	unsigned long nr_leaves_on_tree;
 -	bool retained;
 -	int keylen, slot, nr_free, next_slot, i;
 +	struct assoc_array_node *new_n;
 +	struct assoc_array_ptr *new_parent;
 +	int keylen;
 =20
 -	pr_devel("-->%s()\n", __func__);
 +	new_parent =3D w->new_n ? assoc_array_node_to_ptr(w->new_n) : NULL;
 =20
 -	if (!array->root)
 -		return 0;
 -
 -	edit =3D kzalloc_obj(struct assoc_array_edit);
 -	if (!edit)
 -		return -ENOMEM;
 -	edit->array =3D array;
 -	edit->ops =3D ops;
 -	edit->ops_for_excised_subtree =3D ops;
 -	edit->set[0].ptr =3D &array->root;
 -	edit->excised_subtree =3D array->root;
 -
 -	new_root =3D new_parent =3D NULL;
 -	new_ptr_pp =3D &new_root;
 -	cursor =3D array->root;
 -
 -descend:
 -	/* If this point is a shortcut, then we need to duplicate it and
 -	 * advance the target cursor.
 +	/* The node at this position is duplicated, and so is the shortcut in
 +	 * front of it if there is one.  The node is allocated first: the copy
 +	 * of the shortcut starts out pointing at the old node, and must not be
 +	 * in the new tree if the node cannot be allocated, or the cleanup
 +	 * would follow it into the old tree.
  	 */
 +	new_n =3D kzalloc_obj(struct assoc_array_node);
 +	if (!new_n)
 +		return false;
 +
  	if (assoc_array_ptr_is_shortcut(cursor)) {
  		shortcut =3D assoc_array_ptr_to_shortcut(cursor);
  		keylen =3D round_up(shortcut->skip_to_level, ASSOC_ARRAY_KEY_CHUNK_SIZE=
);
  		keylen >>=3D ASSOC_ARRAY_KEY_CHUNK_SHIFT;
  		new_s =3D kmalloc_flex(*new_s, index_key, keylen);
 -		if (!new_s)
 -			goto enomem;
 +		if (!new_s) {
 +			kfree(new_n);
 +			return false;
 +		}
  		pr_devel("dup shortcut %p -> %p\n", shortcut, new_s);
  		memcpy(new_s, shortcut, struct_size(new_s, index_key, keylen));
  		new_s->back_pointer =3D new_parent;
  		new_s->parent_slot =3D shortcut->parent_slot;
 -		*new_ptr_pp =3D new_parent =3D assoc_array_shortcut_to_ptr(new_s);
 -		new_ptr_pp =3D &new_s->next_node;
 +		*link =3D new_parent =3D assoc_array_shortcut_to_ptr(new_s);
 +		link =3D &new_s->next_node;
  		cursor =3D shortcut->next_node;
  	}
 =20
 -	/* Duplicate the node at this position */
 -	node =3D assoc_array_ptr_to_node(cursor);
 -	new_n =3D kzalloc_obj(struct assoc_array_node);
 -	if (!new_n)
 -		goto enomem;
 -	pr_devel("dup node %p -> %p\n", node, new_n);
 +	w->node =3D assoc_array_ptr_to_node(cursor);
 +	pr_devel("dup node %p -> %p\n", w->node, new_n);
  	new_n->back_pointer =3D new_parent;
 -	new_n->parent_slot =3D node->parent_slot;
 -	*new_ptr_pp =3D new_parent =3D assoc_array_node_to_ptr(new_n);
 -	new_ptr_pp =3D NULL;
 -	slot =3D 0;
 +	new_n->parent_slot =3D w->node->parent_slot;
 +	*link =3D assoc_array_node_to_ptr(new_n);
 +	w->new_n =3D new_n;
 +	w->slot =3D 0;
 +	return true;
 +}
 +
 +/*
 + * Carry on through the slots of the node being copied, putting the leaves
 + * the iterator keeps into the copy, as far as the next pointer to a subt=
ree.
 + * Returns that pointer, with w->slot at it, or NULL when the node is don=
e.
 + */
 +static struct assoc_array_ptr *assoc_array_gc_next(struct assoc_array_gc_=
walk *w)
 +{
 +	struct assoc_array_ptr *ptr;
 =20
 -continue_node:
  	/* Filter across any leaves and gc any subtrees */
 -	for (; slot < ASSOC_ARRAY_FAN_OUT; slot++) {
 -		ptr =3D node->slots[slot];
 +	for (; w->slot < ASSOC_ARRAY_FAN_OUT; w->slot++) {
 +		ptr =3D w->node->slots[w->slot];
  		if (!ptr)
  			continue;
 =20
  		if (assoc_array_ptr_is_leaf(ptr)) {
 -			if (iterator(assoc_array_ptr_to_leaf(ptr),
 -				     iterator_data))
 +			if (w->iterator(assoc_array_ptr_to_leaf(ptr),
 +					w->iterator_data))
  				/* The iterator will have done any reference
  				 * counting on the object for us.
  				 */
 -				new_n->slots[slot] =3D ptr;
 +				w->new_n->slots[w->slot] =3D ptr;
  			continue;
  		}
 =20
 -		new_ptr_pp =3D &new_n->slots[slot];
 -		cursor =3D ptr;
 -		goto descend;
 +		return ptr;
  	}
 +	return NULL;
 +}
 +
 +/*
 + * Fold the children of a finished copy into it where their leaves fit in
 + * its free slots, and count its leaves.  Returns the number of free slots
 + * left.
 + */
 +static int assoc_array_gc_fold(struct assoc_array_node *new_n)
 +{
 +	struct assoc_array_ptr *ptr;
 +	bool retained;
 +	int slot, nr_free, next_slot, i;
 =20
  retry_compress:
  	pr_devel("-- compress node %p --\n", new_n);
@@@ -1682,24 -1620,8 +1682,24 @@@
  		goto retry_compress;
  	}
  	pr_devel("after: %lu\n", new_n->nr_leaves_on_branch);
 +	return nr_free;
 +}
 =20
 -	nr_leaves_on_tree =3D new_n->nr_leaves_on_branch;
 +/*
 + * The copy of the node being worked on is finished: fold its children in=
to
 + * it, then remove it if all it holds is a shortcut, or remove the shortc=
ut
 + * in front of it if it is small.  Returns what is then the copy's parent=
, or
 + * NULL if it is at the root, when the whole tree has been copied.
 + */
 +static struct assoc_array_ptr *assoc_array_gc_pack(struct assoc_array_gc_=
walk *w)
 +{
 +	struct assoc_array_shortcut *new_s;
 +	struct assoc_array_node *new_n =3D w->new_n;
 +	struct assoc_array_ptr *ptr, *new_parent;
 +	int nr_free, slot;
 +
 +	nr_free =3D assoc_array_gc_fold(new_n);
 +	w->nr_leaves_on_tree =3D new_n->nr_leaves_on_branch;
 =20
  	/* Excise this node if it is singly occupied by a shortcut */
  	if (nr_free =3D=3D ASSOC_ARRAY_FAN_OUT - 1) {
@@@ -1717,8 -1639,8 +1717,8 @@@
  			if (!new_parent) {
  				new_s->back_pointer =3D NULL;
  				new_s->parent_slot =3D 0;
 -				new_root =3D ptr;
 -				goto gc_complete;
 +				w->new_root =3D ptr;
 +				return NULL;
  			}
 =20
  			if (assoc_array_ptr_is_shortcut(new_parent)) {
@@@ -1734,15 -1656,16 +1734,15 @@@
  				if (!new_parent) {
  					new_s->back_pointer =3D NULL;
  					new_s->parent_slot =3D 0;
 -					new_root =3D ptr;
 -					goto gc_complete;
 +					w->new_root =3D ptr;
 +					return NULL;
  				}
  			}
 =20
  			new_s->back_pointer =3D new_parent;
  			new_s->parent_slot =3D slot;
 -			new_n =3D assoc_array_ptr_to_node(new_parent);
 -			new_n->slots[slot] =3D ptr;
 -			goto ascend_old_tree;
 +			assoc_array_ptr_to_node(new_parent)->slots[slot] =3D ptr;
 +			return new_parent;
  		}
  	}
 =20
@@@ -1751,135 -1674,59 +1751,135 @@@
  	 */
  	ptr =3D new_n->back_pointer;
  	if (!ptr)
 -		goto gc_complete;
 +		return NULL;
 =20
 -	if (assoc_array_ptr_is_shortcut(ptr)) {
 -		new_s =3D assoc_array_ptr_to_shortcut(ptr);
 -		new_parent =3D new_s->back_pointer;
 -		slot =3D new_s->parent_slot;
 +	if (!assoc_array_ptr_is_shortcut(ptr))
 +		return ptr;
 =20
 -		if (new_n->nr_leaves_on_branch <=3D ASSOC_ARRAY_FAN_OUT) {
 -			struct assoc_array_node *n;
 +	new_s =3D assoc_array_ptr_to_shortcut(ptr);
 +	new_parent =3D new_s->back_pointer;
 +	slot =3D new_s->parent_slot;
 =20
 -			pr_devel("excise shortcut\n");
 -			new_n->back_pointer =3D new_parent;
 -			new_n->parent_slot =3D slot;
 -			kfree(new_s);
 -			if (!new_parent) {
 -				new_root =3D assoc_array_node_to_ptr(new_n);
 -				goto gc_complete;
 -			}
 -
 -			n =3D assoc_array_ptr_to_node(new_parent);
 -			n->slots[slot] =3D assoc_array_node_to_ptr(new_n);
 +	if (new_n->nr_leaves_on_branch <=3D ASSOC_ARRAY_FAN_OUT) {
 +		pr_devel("excise shortcut\n");
 +		new_n->back_pointer =3D new_parent;
 +		new_n->parent_slot =3D slot;
 +		kfree(new_s);
 +		if (!new_parent) {
 +			w->new_root =3D assoc_array_node_to_ptr(new_n);
 +			return NULL;
  		}
 -	} else {
 -		new_parent =3D ptr;
 -	}
 -	new_n =3D assoc_array_ptr_to_node(new_parent);
 =20
 -ascend_old_tree:
 -	ptr =3D node->back_pointer;
 +		assoc_array_ptr_to_node(new_parent)->slots[slot] =3D
 +			assoc_array_node_to_ptr(new_n);
 +	}
 +	return new_parent;
 +}
 +
 +/*
 + * Go back up from the node just finished to the node above it, whose cop=
y is
 + * parent, and on to that node's next slot.
 + */
 +static void assoc_array_gc_ascend(struct assoc_array_gc_walk *w,
 +				  struct assoc_array_ptr *parent)
 +{
 +	struct assoc_array_shortcut *shortcut;
 +	struct assoc_array_ptr *ptr, *cursor;
 +	int slot;
 +
 +	w->new_n =3D assoc_array_ptr_to_node(parent);
 +
 +	ptr =3D w->node->back_pointer;
  	if (assoc_array_ptr_is_shortcut(ptr)) {
  		shortcut =3D assoc_array_ptr_to_shortcut(ptr);
  		slot =3D shortcut->parent_slot;
  		cursor =3D shortcut->back_pointer;
 -		if (!cursor)
 -			goto gc_complete;
  	} else {
 -		slot =3D node->parent_slot;
 +		slot =3D w->node->parent_slot;
  		cursor =3D ptr;
  	}
  	BUG_ON(!cursor);
 -	node =3D assoc_array_ptr_to_node(cursor);
 -	slot++;
 -	goto continue_node;
 +	w->node =3D assoc_array_ptr_to_node(cursor);
 +	w->slot =3D slot + 1;
 +}
 =20
 -gc_complete:
 -	edit->set[0].to =3D new_root;
 +/**
 + * assoc_array_gc - Garbage collect an associative array.
 + * @array: The array to clean.
 + * @ops: The operations to use.
 + * @iterator: A callback function to pass judgement on each object.
 + * @iterator_data: Private data for the callback function.
 + *
 + * Collect garbage from an associative array and pack down the internal t=
ree to
 + * save memory.
 + *
 + * The iterator function is asked to pass judgement upon each object in t=
he
 + * array.  If it returns false, the object is discard and if it returns t=
rue,
 + * the object is kept.  If it returns true, it must increment the object's
 + * usage count (or whatever it needs to do to retain it) before returning.
 + *
 + * This function returns 0 if successful or -ENOMEM if out of memory.  In=
 the
 + * latter case, the array is not changed.
 + *
 + * The caller should lock against other modifications and must continue t=
o hold
 + * the lock until assoc_array_apply_edit() has been called.
 + *
 + * Accesses to the tree may take place concurrently with this function,
 + * provided they hold the RCU read lock.
 + */
 +int assoc_array_gc(struct assoc_array *array,
 +		   const struct assoc_array_ops *ops,
 +		   bool (*iterator)(void *object, void *iterator_data),
 +		   void *iterator_data)
 +{
 +	struct assoc_array_gc_walk w =3D {
 +		.iterator	=3D iterator,
 +		.iterator_data	=3D iterator_data,
 +	};
 +	struct assoc_array_edit *edit;
 +	struct assoc_array_ptr *ptr, *parent, **link;
 +
 +	pr_devel("-->%s()\n", __func__);
 +
 +	if (!array->root)
 +		return 0;
 +
 +	edit =3D kzalloc_obj(struct assoc_array_edit);
 +	if (!edit)
 +		return -ENOMEM;
 +	edit->array =3D array;
 +	edit->ops =3D ops;
 +	edit->ops_for_excised_subtree =3D ops;
 +	edit->set[0].ptr =3D &array->root;
 +	edit->excised_subtree =3D array->root;
 +
 +	ptr =3D array->root;
 +	link =3D &w.new_root;
 +	for (;;) {
 +		if (!assoc_array_gc_copy(&w, ptr, link))
 +			goto enomem;
 +
 +		/* Find the next subtree to copy: further on in this node, or,
 +		 * when it is done, in the nodes above it.
 +		 */
 +		while (!(ptr =3D assoc_array_gc_next(&w))) {
 +			parent =3D assoc_array_gc_pack(&w);
 +			if (!parent)
 +				goto copied;
 +			assoc_array_gc_ascend(&w, parent);
 +		}
 +		link =3D &w.new_n->slots[w.slot];
 +	}
 +
 +copied:
 +	edit->set[0].to =3D w.new_root;
  	assoc_array_apply_edit(edit);
 -	array->nr_leaves_on_tree =3D nr_leaves_on_tree;
 +	array->nr_leaves_on_tree =3D w.nr_leaves_on_tree;
  	return 0;
 =20
  enomem:
  	pr_devel("enomem\n");
 -	assoc_array_destroy_subtree(new_root, edit->ops);
 +	assoc_array_destroy_subtree(w.new_root, edit->ops);
  	kfree(edit);
  	return -ENOMEM;
  }

--qJyN0fTmoIFKO5F1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8aZAACgkQJNaLcl1U
h9BlDgf+IuVB2uZ9B36uP5t6PWnAIq5dAMpTQSALzEuRxx7RlExeF3DsB+UwXqMb
PiyeZDqo6v96WsxpS25yPm2xCriAF7IQhOZ1452wBBfGyKxNhBB+PjSeu6MvJ1V6
8OksU4BkbM1sqCf4KfhTeabDcA+z+P5xy14Fv5wnzwJaDXp/PbTXR7z2M1mD7PCF
ZfYiPfJAwbS0uyJ723UF/SYMKlohc6zXEJVlaLmvSU3E/J1kv6GGKF9AdsmGbEks
pj5sh7f/tdKnY9h3ZZke6c/fq0aCaqhlmU8zExslX1dJnbKAy/CRC8EiSFJmptr8
N1VtGdmTSWqPyH7oxubSMuCEsJUeHg==
=eWeG
-----END PGP SIGNATURE-----

--qJyN0fTmoIFKO5F1--
