Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083371;
	b=z0JRE+2jrPd6z8lgHvf5qJrBJqF1fw3v5t0cEwD0vDGMNIFNsQ3yefprVRnIWjTzVDbY
	 RzYZDatSv/a8t9YBf8xS2goVL6yWjfiKtSIk5Uk1X6d6i5tE6elGxEl9YEO8jMDzf8ZIz
	 c9yBwzSDBFXlZsQWMWcdhbqJZ28uOfQACJoN9em0i9vslnvjxaseR98bLkFxWfso1IT0P
	 KCXMFJVh40ntQwAbABLC1Ek/60AUPh4uo886KZpKrgywPoV6o+rQ5KGutq6DWK1mRvZ1Y
	 yGVYB9cpxNtq3dmGltWIZR4mscxbk0N8UQyGjIIamh1fThfT7zQBSLCc/Utaf7Nk/VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083371;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pRiCUUjLhGU4QryeqhGvx/oq8Ldr8tbhEqJVg4ZBW9A=;
	b=USVtVZxutF7QH87PsnFk1Zc4aySnb4T6bUseyMIWINzCohBhMzLTXNQyRNBaNijd8QkJ
	 63aFZKl6ro+0JlZG976xgc0rHHHkcBNvc6puVo8TI7NRiVzNZiF5tzRbMuOjciQ08dgx9
	 +wvJ2RVA3H5aXsT62JMLuMvWrCUvuTd4l0Gk6/y+/WQy4pFfgJF4pmbyTcCP7b1KA5yjV
	 hHwb0XfLABKy1e9j6gf6/jvxGREY5l0u+Np2vuRy1CgfwQsiY560Tp/PkfAdjm5RmgBoN
	 bEURk+E4mwQeqfPn+KtkfFG52hhszOtH68toSOzIgSLeCzDDGSTsCSihy5G5gJMK0Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcQd5Rgx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3722606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcQd5Rgx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BBD1F031E0
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793083370;
	bh=pRiCUUjLhGU4QryeqhGvx/oq8Ldr8tbhEqJVg4ZBW9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RcQd5Rgx2hQVnLWed84Onq61jdm8RewlmVFnETkOabWqsAIYlP3t6v4NDguMWicf4
	 XIoPv6Q/N2BjvVqNIdr0SJ4Q3tJrBxXi68L/8eqMPN8VxsDzTXBEyTU8ubCCCsPGAY
	 cNzztg1U8597P0XqYS9yQ72n9R4sE77DtrOwpuyGA2TEC1rjOR8Pp7Et4MSElyd3Yo
	 tGLt6gc98IH3gRI9dGsPCN0m2TxrII9PhM37Jmv7c8jshDscyh2A2II6jxlrQTgG8k
	 8AYM3VgfN69mc04S0LIOcwWoYgPM8M20Ej+ABvrkFormUoOgBdW3LhTe4V7jY1wlgD
	 FRQ4Oro1Oi57g==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-704597ef1d8so1688556eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:42:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByU985/E5dKis4m6P9B1kdpPNNDu81RRDg7kOgTmq5EnODNDGVExFLJgSmF6NKJ/adfA7d1DUUkEJ+u6V0=@vger.kernel.org
X-Gm-Message-State: AFq9FYILACQIw7LDFpHUnhUwS3YWCZlQJf6PUQiOuaTR58ouPL3KlENc
	PSr5sFpgZo5R0qtKB+3TX5OrKrwGjrJ+Dy0cZuEzRCrtnHDDQUO9oBi5nsj6nTnqGAF58S3YJOJ
	UiOpXrMGzBGWYtIlzPoUFSNNz4un1Eog=
X-Received: by 2002:a05:6870:c22b:b0:48f:e25e:e202 with SMTP id
 586e51a60fabf-4a83f5b8983mr5062981fac.61.1793083369809; Mon, 26 Oct 2026
 23:42:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026091549.605810-1-p@1g4.org> <20261026091549.605810-2-p@1g4.org>
In-Reply-To: <20261026091549.605810-2-p@1g4.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 27 Oct 2026 07:42:39 +0100
X-Gmail-Original-Message-ID: <CAL4WiioPvWBTb7uq2ny=AApqoDst6fFr6pVYDjw+LfP9UB9q2Q@mail.gmail.com>
X-Gm-Features: AclHuK95zom0Wqqrue6m7-lKPoAo3R_113cwV3WAYgHulj4dz6QgUcVJPRpgglw
Message-ID: <CAL4WiioPvWBTb7uq2ny=AApqoDst6fFr6pVYDjw+LfP9UB9q2Q@mail.gmail.com>
Subject: Re: [PATCH net 2/3] igc: prepare TSO and checksum offloads before TX timestamps
To: Paul Moses <p@1g4.org>
Cc: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, aleksandr.loktionov@intel.com, 
	chwee.lin.choong@intel.com, faizal.abdul.rahim@linux.intel.com, 
	horms@kernel.org, vinicius.gomes@intel.com, sasha.neftin@intel.com, 
	matthew.vick@intel.com, aduyck@mirantis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 26 oct. 2026 =C3=A0 10:16, Paul Moses <p@1g4.org> a =C3=A9crit :
>
> igc_request_tx_tstamp() takes an extra skb reference before transmit
> preparation. For GSO packets, igc_tso() calls skb_cow_head(), which can
> reach pskb_expand_head() with a shared skb when the header is cloned.
> Commit c7d8bc3dd511 ("net: skbuff: don't BUG() on bad arguments to
> pskb_expand_head()") replaced the BUG_ON() with -EINVAL, causing TSO
> preparation to fail and the packet to be dropped.
>
> For non-GSO packets with CHECKSUM_PARTIAL, igc_tx_csum() falls back to
> skb_checksum_help() for unsupported checksum offsets. This can also
> reach pskb_expand_head() through skb_ensure_writable(). igc_tx_csum()
> ignores the error, allowing transmission to continue without completing
> the checksum.
>
> Move TSO and checksum preparation before TX timestamp reservation so
> the extra skb reference cannot interfere with either operation.
>
> Fixes: 2c344ae24501 ("igc: Add support for TX timestamping")
> Fixes: f38b782dccab ("igc: Add support for TSO")
> Signed-off-by: Paul Moses <p@1g4.org>
> ---

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
