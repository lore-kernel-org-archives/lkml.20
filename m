Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935034;
	b=NgyOTg1QDmdbDXzqar61ig2G1txtdU3w7cPu/W0rlB8LBLfurzs+LbH54UQX2T1jD0IN
	 kKkfrFhSYtGvTVLyj7+GoUeXFCp/GqqRMjskvcCklolFIJJ5pWfZKpaYWnbferjxGs8A3
	 Y3/mcGWztrt8SWSJP9iBipRMs+O5DV+XrV+uF8EDtHjULdWy/VIqmWHaQ3GcuBpqdDowj
	 tHJkLJj39g2y8+BKMv/V0sXGafDPPHaaoGmnTplL2sWJD1jFIDcheUU8RLEc3O0ax8QHU
	 eCuPHTHNsuFgjF6GWd8QZzZbFCraUK+ae64VB54gkDT1OE3T9a16x3hVodZPerU+MmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935034;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6dFwgttTw42R11mfM5CS+XLJ1B724S1YmPtAmkJ59Zg=;
	b=gq8rY7CHz3qg2bkxGRw+4aAz/gtYmwwv+NiJArkzgtzsPNZYJiTuaytlRI/2ZARu9qs1
	 PYIRccCtX6lCFlN+oI2jPW8IgUjt2kk4peNtNPWNAeTDZ7qZDs+xTn0lMvJwVy07W27R9
	 amVo16C2bvppJW/AQ/NqG8k6ER4EEOlKljPxgghRLSr0Fpwsz7YV9PENPsdBehnL3ubQA
	 SMpZwcQm3Tt1AnaHpMAarMm/QPwqPWByuQY/csqFMwKXRVJDvENJeg0+nae4XUngjqfq6
	 FuODr+nIdArJ38lqAzz0bdYsHtEg1SLQ3zrez7clssHqsAa4D5+h+2VSx1Pu14ElS9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=id5wW1Yc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F270606A31C;
	Tue, 17 Nov 2026 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=id5wW1Yc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3DD1F000C5;
	Tue, 17 Nov 2026 17:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935034;
	bh=6dFwgttTw42R11mfM5CS+XLJ1B724S1YmPtAmkJ59Zg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=id5wW1Yc8sK5qIZOs77g2mA0NjqLmOmsePJZZhyrbS77fOlAPbsi+zaw3zw5U9iTg
	 ufz7dU/V2oPT5huVg/MYUTklZnqGCgE91SNFWuRm0ccQEGzbdt/+dhdLPD8EnbH2uk
	 iFhseD4OSLMQQsFR+/Rur3Wns7rRWpPJahElxuAWB7lhHPWlA/ju6WoRuac2eA+fJz
	 2AEyYIcLmxqjR70+QyPcSQXE31rtuIDAw3W9SX3j+AIx+WfgDMFwvKGzRJgjFXQr8+
	 seS5WTDvrPHhZQ4A54q1iJw4BGhXMiuEPEEQag+/cq+bWn+VgQwkx/pV2o1x+7NG8q
	 tSuTUaYQky4iA==
Subject:
 Re: [PATCH net] tap: clamp zero-copy copylen to remaining payload length
From: netdev-bot+sashiko@kernel.org
To: graypanda.inzag@gmail.com
Cc: willemdebruijn.kernel@gmail.com, jasowangio@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 17:03:53 +0000
Message-ID: <179493503300.3136.4070504744747730772@kernel.org>
In-Reply-To: <20261113164903.785381-1-graypanda.inzag@gmail.com>
References: <20261113164903.785381-1-graypanda.inzag@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The Fixes: trailer in the commit message is an unfilled
  template: `Fixes: <12자리_커밋_해시> ("<원본_커밋_제목>")`.
- [Low] The commit message and the new comment ("A padded vnet header can
  leave fewer payload bytes than GOODCOPY_LEN.") describe only the…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but tun_get_user()
  in drivers/net/tun.c has the same unbounded zero-copy copylen.

--

tap: clamp zero-copy copylen to remaining payload length

This commit clamps copylen in the zero-copy TX branch of tap_get_user()
to the remaining payload length. Without the clamp, a padded vnet header
can leave fewer frame bytes than GOODCOPY_LEN, and the uninitialized
part of the skb linear head is then transmitted.

> Fixes: <12자리_커밋_해시> ("<원본_커밋_제목>")

[Severity: Medium]
This trailer looks like an unfilled template. The placeholders translate
to "<12-digit commit hash>" and "<original commit title>".

The trailer sits above the --- separator, so git am keeps it in the
applied commit, and stable tooling can't use it to select the fix for
backporting.

Could this cite the commit that introduced the zero-copy copylen sizing
in tap_get_user()? That would be either the macvtap zerocopy support or
the later copylen clamp rework.

> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index 2f19fb07bb2d4..b1f8776a5ca57 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
>  		struct iov_iter i;
>  
>  		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
> +		/* A padded vnet header can leave fewer payload bytes than GOODCOPY_LEN. */
> +		copylen = min_t(unsigned long, copylen, len);

[Severity: Low]
The comment and the commit message only describe the case where
hdr_len == 0 falls back to GOODCOPY_LEN. Doesn't this min_t() also close
a second trigger?

__tun_vnet_hdr_get() checks hdr_len against the iterator count before it
skips the header padding:

drivers/net/tun_vnet.h:__tun_vnet_hdr_get() {
    ...
	if (hdr_len > iov_iter_count(from))
		return -EINVAL;

	iov_iter_advance(from, sz - parsed_size);
    ...
}

That means a guest-supplied hdr_len is bounded by payload plus padding,
not by len. Before this patch, with a large TUNSETVNETHDRSZ,
clamp(hdr_len, ETH_HLEN, good_linear) could reach good_linear while len
is only 14. The leak would then be much larger than the 114 bytes
described.

Should the changelog and the comment mention this path, so the size of
the disclosure isn't understated?

[Severity: High]
This is a pre-existing issue and wasn't introduced by this patch, but
does tun_get_user() in drivers/net/tun.c have the same unbounded
copylen?

drivers/net/tun.c:tun_get_user() {
    ...
		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
		linear = copylen;
    ...
}

Nothing bounds copylen to len there. When zerocopy is set,
tun_can_build_skb() returns false, and tun_alloc_skb() calls
skb_put(skb, linear) with linear == copylen. zerocopy_sg_from_iter()
then copies only min(skb_headlen(skb), iov_iter_count(from)) bytes into
the head.

Both triggers seem to apply to tun:

  - the 246-byte vnet header plus 14-byte frame from the commit message
    (tun_vnet_ioctl() only enforces a lower bound on the header size)
  - an oversized guest hdr_len, as described above

tun_chr_open() sets SOCK_ZEROCOPY unconditionally. With
vhost_net.experimental_zcopytx=1, the more common tun backend would
therefore still put uninitialized host heap bytes on the wire.

The notes below the --- cite the analogous tun.c report. Is a matching
fix for tun_get_user() planned?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113164903.785381-1-graypanda.inzag%40gmail.com
