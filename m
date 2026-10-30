Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348730;
	b=oQLh++ZoxDrjicxGMlTxtElGdlEeB5cCWf0ZrGnSno+xviWD2gOijWT/NAVoaSOFdtTa
	 jmrUYE7HfviXSLCNhluBK59cILuVLPFQ5tyHICmx0Kz3yA3jz2jTQ4gHHEbPXlu5ssCt+
	 6CsbZS705BrZKtB5Yr5XyYWVRZ2Ds6ie1rpOjdbtn+rI4JMIjjHiEvgtnpyzpyQ7XxnVc
	 Xqif4zrSFG1ZsAKMKXbWINauR6TMNjqTJSpm9/RinoQTd00ynJnb9Ewa+NYop5/QvV962
	 7GM9TzzKyfHUge0qnGw7y6HToBQ11jmhCKrAm9NPs95lj52H39pv281aQfjxEjWHE+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348730;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=FpZIHcgKO+Xs7CZXmoKQhmN/LSf3cdMMh0LQe4d71zw=;
	b=vPtls6qU0u5i10/73A1JoRqGMHkTfj0noLZhMtABfsgRtfgBx+gbeuPMRD86U3Aq6tpx
	 Z1UWV5/5M8IvHA6WMwLZN1b86x1iOLk/WjUzvEqtPVeZjt30Ea8hWVcGHzoDHMRbqZTiA
	 m01uIPSgE9HxOGUT1Sc8cRp1kc5ApAeBHITB8Etrc2/wpOhC8b+adxJNsaSUJWJpplRax
	 pJP1bdxF1oGL3h5/A/1m+WAtpnjOPPdEj79/BFFqRmf6H22q9InG4fq5xjKx8bmDnQk+y
	 crO+PvqhfwXqdGjbUjvVvOrr9wTSMPmwli5AU1QDf1wI1IQ89NCqQxenysXUdI5i44g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=tZ78MRRw;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CCD606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CCD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=tZ78MRRw
Received: by dvalin.narfation.org (Postfix) id F31191FDE9;
	Fri, 30 Oct 2026 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1793348721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FpZIHcgKO+Xs7CZXmoKQhmN/LSf3cdMMh0LQe4d71zw=;
	b=tZ78MRRwNa98nIWNcNcTteCZahGGyQpd8uXSexYvMVar4z0inQo1IuK9v+qpHPpwKXmZz6
	BgezY/yATpcHX+imOfW4o79yXW7ahD/y5t2EZefIg7z1F6K6ASSRPYqjIVDbQOME8uhtMt
	ULWJCvkUKiiAtYTCakSXq3HFHFFsS6w=
From: Sven Eckelmann <sven@narfation.org>
To: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com,
 =?UTF-8?B?w5ZtZXI=?= Mete Kaya <omermetekaya0@gmail.com>
Cc: davem@davemloft.net, b.a.t.m.a.n@lists.open-mesh.org,
 linux-kernel@vger.kernel.org,
 syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com,
 =?UTF-8?B?w5ZtZXI=?= Mete Kaya <omermetekaya0@gmail.com>
Subject: Re: [PATCH net] batman-adv: reduce softirq drain in tt_purge loops
Date: Fri, 30 Oct 2026 09:25:18 +0100
Message-ID: <5221322.cEBGB3zze1@ripper>
In-Reply-To: <20261030000222.286935-1-omermetekaya0@gmail.com>
References: <20261030000222.286935-1-omermetekaya0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5639495.0VBMTVartN";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5639495.0VBMTVartN
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Fri, 30 Oct 2026 09:25:18 +0100
Message-ID: <5221322.cEBGB3zze1@ripper>
In-Reply-To: <20261030000222.286935-1-omermetekaya0@gmail.com>
References: <20261030000222.286935-1-omermetekaya0@gmail.com>
MIME-Version: 1.0

On Friday, 30 October 2026 00:59:51 CET =C3=96mer Mete Kaya wrote:
> Replace per-bucket spin_lock_bh()/spin_unlock_bh() with outer
> local_bh_disable()/enable() and periodic drain every 64 buckets
> to avoid excessive softirq processing during TT purge.

I would prefer if there is paragraph explaining what the actual problem is=
=20
instead of "avoid excessive softirq processing during TT purge." - I would =
not=20
know what is going on or if it is a critical problem just from these couple=
 of=20
words.

> Add may_sleep parameter to batadv_tt_local_purge() since it is
> called both from workqueue context (where cond_resched is safe)
> and under commit_lock spinlock in batadv_tt_local_resize_to_mtu()
> (where sleeping is not allowed).

But what was the intention to have the potential sleeps in the first place.=
 It=20
is most likely good to have them but it is not explained here at all.

And if there is a good reason to have it - would there be any bigger proble=
ms when it runs under batadv_tt_local_purge() without it?

> Fixes: c6c8fea29769 ("net: Add batman-adv meshing protocol")
> Reported-by: syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D61b202fdc410840f0198
> Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>
> ---
>  net/batman-adv/translation-table.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)


This is not going through net (or net-next). So please don't mark it like i=
t.=20
The target would be the batadv tree.

Is there a good reason to have this sent through a non-next tree and get it=
=20
backported to various stable trees? For me, it looks just like the system h=
as=20
a loop ("bridge0: received packet on bridge_slave_1 with own address as sou=
rce=20
address") and therefore the system is under heavy load. Due to this problem=
,=20
some other tasks will take longer - like the workqueue task from batadv. An=
d=20
you are now trying to remove the kernel splat
"BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D-20 stuc=
k for 32s!"

=46or the moment, I don't understand why this has to be handled like some=20
critical fix in batman-adv. It is just a bystander which suffers from the=20
current system state. If you think that you can optimize the situation for=
=20
batman-adv - fine. But this is then something for batadv-next and not a fix=
=20
which needs to enter net + needs to be backported.

But maybe I am misunderstanding the problem here - please describe it bette=
r,=20
so I can also understand what the problem+idea is behind your change. And I=
 am=20
not talking about just putting in a lot of text like these LLMs are generat=
ing=20
nowadays. I am talking about a simple to follow explanation which result in=
 me=20
thinking "hey, this is good to have in following tree/branch".


Btw. it doesn't apply in the batadv tree (shown here):

$ ./scripts/get_maintainer.pl --scm ./20261030000222.286935-1-omermetekaya0=
@gmail.com.mbx
[...]
git https://git.open-mesh.org/batadv.git
[...]


There is a conflict in batadv_tt_local_resize_to_mtu() due to the commit=20
48d05a984683 ("batman-adv: tt: limit local table to single TVLV response=20
size"). It is only a small context conflict:

@@ net/batman-adv/translation-table.c: static void batadv_tt_purge(struct w=
ork_stru
  	batadv_tt_req_purge(bat_priv);
  	batadv_tt_roam_purge(bat_priv);
 @@ net/batman-adv/translation-table.c: void batadv_tt_local_resize_to_mtu(=
struct net_device *mesh_iface)
=2D 		if (packet_size_max >=3D table_size)
+ 		if (size_max >=3D table_size)
  			break;
 =20
 -		batadv_tt_local_purge(bat_priv, timeout);


> diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translat=
ion-table.c
> index 68f79853032e..915f5589e056 100644
> --- a/net/batman-adv/translation-table.c
> +++ b/net/batman-adv/translation-table.c
> @@ -1386,21 +1386,29 @@ static void batadv_tt_local_purge_list(struct bat=
adv_priv *bat_priv,
>   *  inactive or not
>   */
>  static void batadv_tt_local_purge(struct batadv_priv *bat_priv,
> -				  int timeout)
> +				  int timeout, bool may_sleep)

New parameter is not documented.

>  {
>  	spinlock_t *list_lock; /* protects write access to the hash lists */
>  	struct batadv_hashtable *hash =3D bat_priv->tt.local_hash;
>  	struct hlist_head *head;
>  	u32 i;
>=20
> +	local_bh_disable();
>  	for (i =3D 0; i < hash->size; i++) {
>  		head =3D &hash->table[i];
>  		list_lock =3D &hash->list_locks[i];
>=20
> -		spin_lock_bh(list_lock);
> +		spin_lock(list_lock);
>  		batadv_tt_local_purge_list(bat_priv, head, timeout);
> -		spin_unlock_bh(list_lock);
> +		spin_unlock(list_lock);
> +
> +		if (may_sleep && (i & 63) =3D=3D 63) {
> +			local_bh_enable();
> +			cond_resched();

You are missing the include for this function:
#include <linux/sched.h>

> +			local_bh_disable();
> +		}
>  	}
> +	local_bh_enable();
>  }

This looks like a workaround for a problem which isn't described very well.=
=20
Are there any precedents in the Linux kernel?

I know of things like ctnetlink_dump_table() with the large local_bh_disabl=
e()=20
and inner spinlocks. But I know of nothing with the cond_resched. But since=
 I=20
don't know why it was added in the first place, I would a better explanatio=
n=20
of the problem and the reasoning why it was tried to be fixed like you did.


=46or me, it looks like you intended to cut the worker->softirq switches fr=
om=20
1024 to 16. But it is unclear why this would help here because there seems =
to=20
be quite some heavy (pending) load on the system which will then still run=
=20
when local_bh_enable() is called (on this CONFIG_PREEMPT kernel).


>  static void batadv_tt_local_purge(struct batadv_priv *bat_priv,
> -				  int timeout)
> +				  int timeout, bool may_sleep)
[...]
> @@ -2363,11 +2371,12 @@ static void batadv_tt_global_purge(struct batadv_=
priv *bat_priv)


I see changes in batadv_tt_local_purge + batadv_tt_global_purge but where i=
s=20
the change for batadv_tt_local_purge_pending_clients,=20
batadv_tt_global_del_orig, batadv_tt_local_transition_new? I think =20
batadv_tt_global_table_free and batadv_tt_local_table_free are not running =
in=20
the right context, so let us ignore them for now.


And to finish the list, here is the Sashiko output. Please deal with them=20
directly - I hate to write rebuttals for these things when sending it to=20
the next maintainer(s).


=46indings:
  Critical: 0  High: 0  Medium: 1  Low: 2

  --- Patch [1] batman-adv: reduce softirq drain in tt_purge loops ---
  [Low] batman-adv: batadv_tt_local_purge() kernel-doc missing new @may_sle=
ep param
  [Low] batman-adv: tt purge loops hold BH disabled across 64 buckets inste=
ad of 1
  [Medium] batman-adv: commit message claims softirq reduction; patch only =
defers it


Inline Review:
commit ae1b9a789b6f70e3fdb116868b75058b32b7b764
Author: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>

batman-adv: reduce softirq drain in tt_purge loops

This commit replaces the per-bucket spin_lock_bh()/spin_unlock_bh() calls
in batadv_tt_local_purge() and batadv_tt_global_purge() with an outer
local_bh_disable() section. That section is briefly re-enabled, with a
cond_resched(), every 64 buckets. A may_sleep parameter is added so that
batadv_tt_local_resize_to_mtu(), which holds commit_lock, skips the
rescheduling point.

Closes: https://syzkaller.appspot.com/bug?extid=3D61b202fdc410840f0198

>     batman-adv: reduce softirq drain in tt_purge loops
>
>     Replace per-bucket spin_lock_bh()/spin_unlock_bh() with outer
>     local_bh_disable()/enable() and periodic drain every 64 buckets
>     to avoid excessive softirq processing during TT purge.
>
>     Add may_sleep parameter to batadv_tt_local_purge() since it is
>     called both from workqueue context (where cond_resched is safe)
>     and under commit_lock spinlock in batadv_tt_local_resize_to_mtu()
>     (where sleeping is not allowed).
>
>     Fixes: c6c8fea29769 ("net: Add batman-adv meshing protocol")
>     Reported-by: syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com
>     Closes: https://syzkaller.appspot.com/bug?extid=3D61b202fdc410840f0198
>     Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>
>     Signed-off-by: Sven Eckelmann <sven@narfation.org>

[Severity: Medium]
Does this patch reduce the softirq work, or only defer it?

Every 64 buckets the loop does:

    local_bh_enable();
    cond_resched();
    local_bh_disable();

local_bh_enable() still runs all pending softirqs, so the total softirq
work looks coalesced rather than reduced. The new behaviour seems to be
the cond_resched() in workqueue context. The message doesn't present that
as the fix, and it doesn't explain how it addresses the syzbot report.

The resize path is also unchanged in practice.
batadv_tt_local_resize_to_mtu() holds
spin_lock_bh(&bat_priv->tt.commit_lock) and passes may_sleep=3Dfalse:

    batadv_tt_local_purge(bat_priv, timeout, false);
    batadv_tt_local_purge_pending_clients(bat_priv);

batadv_tt_local_purge_pending_clients() is called right after, in the same
loop. It also walks every bucket of the local hash, and it still uses
per-bucket spin_lock_bh()/spin_unlock_bh().

Should it be converted too, so that the tt_purge loops are handled
consistently?

The Fixes: tag points at c6c8fea29769, the initial batman-adv import. Is
there a more specific commit that introduced the problem syzbot reported?

> diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translat=
ion-table.c
> index 46304069b3b75..f64f31e25c6b0 100644
> --- a/net/batman-adv/translation-table.c
> +++ b/net/batman-adv/translation-table.c
> @@ -1832,21 +1832,29 @@ static void batadv_tt_local_purge_list(struct bat=
adv_priv *bat_priv,
>   *  inactive or not
>   */
>  static void batadv_tt_local_purge(struct batadv_priv *bat_priv,
> -                               int timeout)
> +                               int timeout, bool may_sleep)

[Severity: Low]
The kernel-doc block above batadv_tt_local_purge() still documents only
@bat_priv and @timeout. Should an @may_sleep line be added?

scripts/kernel-doc will warn that may_sleep is not described. The new
parameter also has a contract worth documenting: it must be false when
the caller holds a spinlock such as tt.commit_lock.

>  {
>       spinlock_t *list_lock; /* protects write access to the hash lists */
>       struct batadv_hashtable *hash =3D bat_priv->tt.local_hash;
>       struct hlist_head *head;
>       u32 i;
> =20
> +     local_bh_disable();
>       for (i =3D 0; i < hash->size; i++) {
>               head =3D &hash->table[i];
>               list_lock =3D &hash->list_locks[i];
> =20
> -             spin_lock_bh(list_lock);
> +             spin_lock(list_lock);
>               batadv_tt_local_purge_list(bat_priv, head, timeout);
> -             spin_unlock_bh(list_lock);
> +             spin_unlock(list_lock);
> +
> +             if (may_sleep && (i & 63) =3D=3D 63) {
> +                     local_bh_enable();
> +                     cond_resched();
> +                     local_bh_disable();
> +             }

[Severity: Low]
With the outer local_bh_disable(), bottom halves now stay disabled for up
to 64 buckets of the hash instead of one.

Before this patch, each spin_unlock_bh() let pending softirqs such as
NET_RX_SOFTIRQ, NET_TX_SOFTIRQ and timers run between buckets. On
preemptible kernels it also allowed the worker to be preempted there.

Could this increase softirq latency on the CPU running batadv_tt_purge()?
On PREEMPT_RT, local_bh_disable() also holds the per-CPU softirq lock for
the whole 64-bucket window.

batadv_tt_global_purge() gets the same wider window, and there the
re-enable runs unconditionally.

Would it work to keep the per-bucket spin_lock_bh() and only add the
cond_resched() every 64 buckets? That would give the same scheduling
point without the longer windows or the new may_sleep parameter.

Regards,
	Sven

--nextPart5639495.0VBMTVartN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCauRUbgAKCRBND3cr0xT1
y27dAQDDyuDiCkEnlhZitfiDvdmmC3K+n/DHBlTkGHMIkh+NtwEAji618FWRwkn3
UJtSuMnyIsLf9HWbef2UuJP08RGtNAc=
=b3gi
-----END PGP SIGNATURE-----

--nextPart5639495.0VBMTVartN--



