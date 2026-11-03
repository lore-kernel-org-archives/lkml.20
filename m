Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735076;
	b=L6+LQ2lBtMGSO4gtS+QcsQzUpYbQrA2XSO5ooM0NtOabaJpz0mPg9cTwvId6bsgWGOPA
	 JBmG8ROS8tZxk9v7mMm5JfZhOm649pqYyGILHGCy1NaU0Z+TGFa35ufxKfHwdaeVm1u36
	 e9YRUS4wGG19IHSZFi9ENasSrBRxQLbj8oNFDccHtkZLG3C8MaRFFTSfQZ8P1cUlj5Pz8
	 3+iKgOXYC2HpScBXCXhszqb/9QidMqb46nuAjjUD5kdAf2VsYLYwmbatVwylaRlfMKg3r
	 8fn6M5vMaE8PiqJXF5+zXckDuf3kdwJ2W8ORp+a5nnsZXK3lH5GV+WWCe7mBxWmGfrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=B6/m899Rgqj87AOa/XTUmqgFLTyvTBajFjQoWmCiPRc=;
	b=U6GMRM/J6baGVyu8w4B6CfYgmzZnF1+jtXX8ix+7iIjEOemh2gGV/O3cbq9i7ss/bN4O
	 ZAre7Nfy2+XbNb6/cyGhmLMEw1UgTNVnBS2ApIOO29B3iEovjj+SD1J3Kxqm1UtnRRalT
	 DVIwqJJD1vIQ0gAe30OiR69a9Q55hUzfWV/ZrrTpCktNBHHF/XH29K0J/3+EGvwiQ7ONi
	 tbHDLQtqXHBEnkpNBatLMwMT3G3qxdt50495UtVFQSGUBSj4vxxAfuyqwnmd3SjSTsi7b
	 OqATdTPGxxP7s2bpydiW0aVP01EfDZ5AB+ebGGWafvGvnE5LXstm7LvqxbZmeEKPehA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NyexZs37;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22573606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22573606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NyexZs37
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67a2efec15cso1084604d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1793735074; x=1794339874; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6/m899Rgqj87AOa/XTUmqgFLTyvTBajFjQoWmCiPRc=;
        b=NyexZs37Rqu/hGwrhw4vc/lv3IgyvrQQmLUu5JnJd6PyP9aFju4jnRnz+uGxBFHUJV
         ggFtIOdZiuUv9sTQrYSptMsHBj880JyYBVDKL8Dt4GWBl2wTZ7OMmya1rFUazVi75v3g
         ID27219Fw/PLYDL987AGsuWQOAPd8c8+LCtiiQNZxuYNexM70FWZy3MSFEev0b6kB0R2
         GRC3DhncU/sq5qgDesFoVRDrb5sxmGE6SmBsudLv4ORgfFjDG7xyFsufyxKM5XtqUpEH
         mjcn6H+jE0pYctRA6O5QgdRDqrnCmdoxuE2jsZ1bA8JzYSP/b/B/GfEHszPA3ckXMFIH
         UsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735074; x=1794339874;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B6/m899Rgqj87AOa/XTUmqgFLTyvTBajFjQoWmCiPRc=;
        b=vokVz5Mb7MgU24aFTBPoL3wbmZhlgxRCi28NTRFpPJpk0EJtTEFdAS2HYUmcBxzTUm
         0E/zU+TyCxENeKEOxXlGUsTEKcMFvIzDYA/NVOnffHQNWE2AQra4dpqdjHK3ZoAgV3M5
         Qv6Wz6GVz1vo9op4/xEk2cK3yHIZ37ECFAz+mGjNMiSYm2E22BC+VQ/9LVMID6w2c6o5
         NDh03HBKlw+bjmmUAuoff1+mEOXvpgRjX0IZHzybfMTiQoCjv239t5AkKeF/tAXlTTiB
         xfvdV+QB5lgO9eq4jilK7O7uJh1xwwXx++4xwJECKW4Ykd+R7dDKDnDTAJa94RN3IcH+
         IjHw==
X-Forwarded-Encrypted: i=1; AKwUvBw6XvuFhhXbqXsHyNt9u1YunS/OjI8oquK3EsY/b2izj9BAXX6Y+IVUtiv5eGZeAgn+mieUKK0u/qMNpOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iebL2A2o8hNP5B/qhQhYke7LqgStiqncFaxO4LI4cqCD36ZU5
	ZByxmtf5E8ND8SbVsT8VJrNS54B3Jz0AgjHiJAmGv36PaiBQCbqTa6z2OKrUo2cf+LU=
X-Gm-Gg: AYBFou1BOt7FarOQBIKJzmGmjYg2GiXlgVYvutNf9UqirqUTkLgmUjw9m1Uo4vnox00
	Nks4qlyNwff+bRFtPGxowuUq/iLk5hjoFcbt2u8cDnSKFIxHgKoJr07RBCv/3WQNhZHR0XdOy3t
	+WdcuzJEBfNqgV4dtTTbP5jitHDBz75VPPXmfZ5JAPSqfBmX2NOPF5DFof+vGHNyHnG8OlFTEiw
	w/9Wzx/m76LWENXTroPJ/2Zv9WAv7W1qPXbIVYoxD93GM7/GTXpKrPpdJuxnizJabVmKQpDPF7k
	OfC7yQLS6h3qFn8YOUWBnTlEnqZz/hCiJ6lpomExMAY5J9Lx4W6XRXGsttP9XUPBhkuidBNqv7s
	tIfvM9GB/Pz3TxNyajIUeFkDM7G+tVXTSUqvrqwA+svs+I4v5KpKbeFX4jSHGwWOjZqybojJ444
	UgIvjqLvC66/HAo2ezorhoUekwkLLCeIEIlCBdsiIXEYFvn0Akb2B4QxtPt3bKQiuZY7Bbh6Tjs
	Eav1axLZ9dAoA5eTKmyDhzAK6vxLDwMrO9qxIl8Wh4vU5rywpAc0kY5xhAiyK5gLiRwwnP6pEpJ
	lmcJwa3ICAE77cMdUCcXl9fRWXoL2dkMzr71ZBY5tBciGe40SZXIcLONRGS4b5vO31El4Pj2qfG
	HMp6qQbRXS3qYXr9elDcnYzAy/IxaykC6d2QtehMNVB/MdEWmD8yA7Z5tsQccJb1arOVo+Fz02e
	TxN/bGug+0BEcNlcHyNRE=
X-Received: by 2002:a05:690e:2622:b0:675:5b6b:64f2 with SMTP id 956f58d0204a3-67a8d47856dmr9530396d50.31.1793735073951;
        Tue, 03 Nov 2026 11:44:33 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:1921:d22d:3124:a258? ([2600:1700:6476:1430:1921:d22d:3124:a258])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee2cad07sm54651d50.22.2026.11.03.11.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:33 -0800 (PST)
Message-ID: <c05f958a83de97e38c2e54bb67ba3478ffd471e1.camel@dubeyko.com>
Subject: Re: [PATCH v2] hfsplus: free failed b-tree nodes in hfs_bnode_put()
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Song jeonghak <thdwjdgkr123@gmail.com>, John Paul Adrian Glaubitz
	 <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Shardul
 Bankar	 <shardul.b@mpiricsoftware.com>, Edward Adam Davis <eadavis@qq.com>,
 Markus Elfring <Markus.Elfring@web.de>,
 syzbot+98547b0428b6a6a3467c@syzkaller.appspotmail.com
Date: Tue, 03 Nov 2026 11:44:31 -0800
In-Reply-To: <20261103022522.21918-1-thdwjdgkr123@gmail.com>
References: <20261103022522.21918-1-thdwjdgkr123@gmail.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-03 at 11:25 +0900, Song jeonghak wrote:
> hfs_bnode_find() flags a node it fails to load with HFS_BNODE_ERROR
> and
> then drops its reference with hfs_bnode_put(). When the last
> reference
> goes away, hfs_bnode_put() only releases nodes flagged
> HFS_BNODE_DELETED.
> Every other node stays hashed in tree->node_hash as a cache entry and
> is
> freed later by hfs_btree_close().
>=20
> That is fine while the tree is open, but hfs_btree_open() looks up
> the
> header node itself. If that lookup fails, hfs_btree_open() unwinds
> with
> iput() and kfree(tree) and never calls hfs_btree_close(). The failed
> node
> is still hashed, nothing references it anymore, and it is leaked.
> syzbot
> triggers this by mounting a corrupted image:
>=20
> =C2=A0 hfsplus: failed to load extents file
> =C2=A0 BUG: memory leak
> =C2=A0 unreferenced object 0xffff8881040930c0 (size 96):
> =C2=A0=C2=A0=C2=A0 __hfs_bnode_create+0x57/0x310 fs/hfsplus/bnode.c:476
> =C2=A0=C2=A0=C2=A0 hfsplus_bnode_find+0x138/0x660 fs/hfsplus/bnode.c:554
> =C2=A0=C2=A0=C2=A0 hfsplus_btree_open+0x30b/0x5d0 fs/hfsplus/btree.c:384
> =C2=A0=C2=A0=C2=A0 hfsplus_fill_super+0x272/0x880 fs/hfsplus/super.c:546
>=20
> Free a node that is flagged HFS_BNODE_ERROR when its last reference
> is
> dropped instead of leaving it hashed. This follows the existing
> HFS_BNODE_DELETED handling: unhash the node under hash_lock, drop the
> lock, then free it. Unlike a deleted node, a node that failed to load
> is
> still part of the on-disk tree; only its in-memory copy is dropped.
> Its
> bit in the allocation map therefore stays set and its on-disk
> contents
> are left alone, so neither hfs_bmap_free() nor hfs_bnode_clear() is
> called for it. A later hfs_bnode_find() of the same node number now
> reads the node from disk again instead of getting the cached failure.
>=20
> Tested with the syzbot C reproducer in QEMU (x86_64, kmemleak) on
> next-20261023: the leak was reported in 3 of 3 runs before the change
> and
> in 0 of 3 runs after it, two of which ran with slub_debug=3DFZPU. On a
> valid image, creating 3000 files, deleting half of them, and
> remounting
> gives identical results before and after, and fsck.hfsplus reports
> the
> volume as OK. checkpatch.pl --strict and sparse report nothing for
> bnode.c. This was not tested with KASAN or with concurrent access to
> the
> same node.
>=20
> Claude (Anthropic) was used to help with the root cause analysis, the
> reproduction setup and drafting this changelog. The code change
> itself
> was written by the submitter.
>=20
> Fixes: 8ad2c6a36ac4 ("hfsplus: validate b-tree node 0 bitmap at mount
> time")
> Reported-by: syzbot+98547b0428b6a6a3467c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D98547b0428b6a6a3467c
> Signed-off-by: Song jeonghak <thdwjdgkr123@gmail.com>
> ---
> Changes in v2:
> - Corrected the changelog. v1 said a failed node "has no b-tree map
> bit
> =C2=A0 to release and no contents to zero out". That is wrong: the node i=
s
> =C2=A0 still part of the on-disk tree, so its map bit is set and its
> contents
> =C2=A0 are on disk. They are left alone on purpose. No code change.
> - Kept HFS_BNODE_ERROR as its own branch rather than folding it into
> =C2=A0 the HFS_BNODE_DELETED one as Markus Elfring suggested, so the fix
> does
> =C2=A0 not touch the existing HFS_BNODE_DELETED path. I can merge them if
> =C2=A0 that is preferred.
> - fs/hfsplus is unchanged between next-20261023 and next-20261102 and
> =C2=A0 the patch applies as is, so the test results above still hold.
>=20
> v1:
> https://lore.kernel.org/all/20261026152139.458677-1-thdwjdgkr123@gmail.co=
m/
>=20
> Viacheslav, v1 did not show up in your mail client. It was sent with
> git send-email as plain text and is on lore at the link above. This
> version is sent the same way.
>=20
> This takes the direction Viacheslav suggested while reviewing Edward
> Adam Davis's earlier attempt, "[PATCH] hfsplus: Supports freeing
> newly
> created tree head" (April 2026): look at HFS_BNODE_ERROR in
> hfs_bnode_put() rather than special-casing the header node. That
> thread
> did not get a follow-up version.
> Link:
> https://lore.kernel.org/all/tencent_C4F16CD096B0EAEAEE5ACDB07A266E382C0A@=
qq.com/
>=20
> fs/hfs has the same structure: hfs_bnode_put() has no HFS_BNODE_ERROR
> handling, and hfs_btree_open() looks up the header node and then
> frees
> the tree without hfs_btree_close() on failure. I have not reproduced
> a
> leak there, so this patch leaves fs/hfs alone.
>=20
> sparse reports a few warnings elsewhere in fs/hfsplus (ioctl.c and
> attributes.c) that are not touched by this patch.
>=20
> =C2=A0fs/hfsplus/bnode.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/fs/hfsplus/bnode.c b/fs/hfsplus/bnode.c
> index 3a1a1fa6f2e2..3d159db229e5 100644
> --- a/fs/hfsplus/bnode.c
> +++ b/fs/hfsplus/bnode.c
> @@ -702,6 +702,14 @@ void hfs_bnode_put(struct hfs_bnode *node)
> =C2=A0			hfs_bnode_free(node);
> =C2=A0			return;
> =C2=A0		}
> +
> +		if (test_bit(HFS_BNODE_ERROR, &node->flags)) {
> +			hfs_bnode_unhash(node);
> +			spin_unlock(&tree->hash_lock);
> +			hfs_bnode_free(node);
> +			return;
> +		}
> +
> =C2=A0		spin_unlock(&tree->hash_lock);
> =C2=A0	}
> =C2=A0}

I've accepted this patchset [1] recently with some modifications on my
side. I assume that it has fixed the issue already. Am I wrong?

Thanks,
Slava.

[1]
https://lore.kernel.org/linux-fsdevel/17c099490060e40254ef25dacdad713d5356c=
2b7.camel@dubeyko.com/
