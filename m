Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092171;
	b=jMEQVALlntKYiCUcbtxzNWPaVnhNpRrbLOOTWy+WL0koDVcRYun3Km82Rk5Grz14zlQw
	 i3qoN3YSVDllUxWcQeAm+amrmppIXwRAN894E0LN5uGN6G1YK/FIU+r+7luA7WjZNWEwE
	 EhTFhBQuOVE7MZJr0USS4dpkWcrlTaLHVd6h9cAJCaz9dyNHaGKEkByoAPfARYccRbghm
	 AYulKVpZLL8lOI5FM3xW5vcxELJSP7fcmcNf+KPukItiZefJS2L6EsqVZE9Z/Eqk1Y2b0
	 102htP+MMoc8jgF4u1QAnkEPwyKwtF2u/t5VY1QaCCh4gPl+H4aB461027qmxU+cc6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092171;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VT3Y5OvSFbO9QB1vLrL/JDIAFG6W923q7UqKoS0saRw=;
	b=V8Ph5cqosmogWkm7ZTxVqDWYu7+2MH8F4rhcJmD2WMrjUBB6RP8DBw7rsTZ/hoV0Tkbf
	 SAFwkUc5hLr5GBpdSN+hp2ts56OmHyP8RLkXKt60QtPTXB7IZEelYPVx3rqCFUttw81X6
	 oxNxDOa7W6gtIpuAUon3pbjMfB6ZAch8XDvs2TzHoU9s0AmA+AFN4BGC3VxhexNalscK2
	 8ECMGhMUzY3a9miDcBvoL9/PSHDTh4JpMHKoIxud+1HWzZfKeOHlJApEtD5HLVN0kj3rG
	 D/cqo/HMttsc/dn9/wKqquBOV2w0z+/LqG3DZx3TONmYRz/2QxFd//XWd7Waxf964Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gL6g0cDE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36CC606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gL6g0cDE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70AE01F031E9
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793092170;
	bh=VT3Y5OvSFbO9QB1vLrL/JDIAFG6W923q7UqKoS0saRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gL6g0cDE/fM1YcljoA1aZnBkluyETfSVdCPCFznt39+S1LfqX3W7PXafW2wNDlgYC
	 Hu+y4trakWqb+ewn7BqriCAIhkt0cawB9tPQ21k4vGD12sliSPExBxINuJxv2rQotr
	 vNDOCC/e1xCvkCGiWU8EzPqlORFljrhhZ2/AIe1AqHBZgJ2kp8cv2NPWpscdff3UUQ
	 vA8WqiGKhwBKQUj4QIKqzNunDhvnOAIJ4Kl6wTo1DiCt6gDREEwwCyQKCJkGGfTZpw
	 EBg/NC6iNMSupxIDQeZ2UmHxXbGEwAfzhWo5W6tsOVBigBCnOwL+4lY/WSBItmSvb3
	 AO3lKl6893s+Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab4354db11so28436941fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:09:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/NEAGXw5p7IvYdApiidc8EOmXO80t0NMMbtuBUy+bEXMx2o1IxpdFXEpcoLuItVyoM6L1hZrC5unQj7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiThKHT6taOUaiA/LDOgTwKEbhpPO4BtDdJuj3cfTjAs4md0vX
	X7wgq9VOtiuaTek7emZqlF/rqX5It3b0a3AI0ub1+CO1DZXl+QyB1ykcO9RaAmfGAdiUfT69VCY
	9tFly5PSUAtKPF0ohb2xlgZnETlx5op8=
X-Received: by 2002:a05:651c:1444:b0:3ab:5423:dd80 with SMTP id
 38308e7fff4ca-3ac6fce6af2mr24493581fa.9.1793092169187; Tue, 27 Oct 2026
 02:09:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027085200.1501599-1-xiaolinkui@126.com>
In-Reply-To: <20261027085200.1501599-1-xiaolinkui@126.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 27 Oct 2026 10:09:16 +0100
X-Gmail-Original-Message-ID: <CAL4WiioJcbB9gB7tbBcwLdRUPG=zX-5B-7G5=oMXGiy=f_WLSg@mail.gmail.com>
X-Gm-Features: AclHuK8EVwFrXUj1qFMsxab1jfMHpLxrzYP4DKEcT8xEm71gKtZLAmqWJRAV0jE
Message-ID: <CAL4WiioJcbB9gB7tbBcwLdRUPG=zX-5B-7G5=oMXGiy=f_WLSg@mail.gmail.com>
Subject: Re: [PATCH net] net: bridge: netlink: do not clear the vlan info dump error
To: Linkui Xiao <xiaolinkui@126.com>
Cc: razor@blackwall.org, idosch@nvidia.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, bridge@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linkui Xiao <xiaolinkui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 oct. 2026 =C3=A0 09:52, Linkui Xiao <xiaolinkui@126.com> a =C3=
=A9crit :
>
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>
> br_fill_ifinfo() assigns the result of br_fill_vlan_tunnel_info() over
> the result of br_fill_ifvlaninfo() or br_fill_ifvlaninfo_compressed()
> instead of only running the second helper when the first one succeeded.
>
> When the vlan information no longer fits in the skb but the port has no
> vlan mapped to a tunnel dst, br_fill_vlan_tunnel_info() walks the vlan
> list and returns 0 without touching the skb. The -EMSGSIZE is lost,
> br_fill_ifinfo() completes a message whose IFLA_AF_SPEC is truncated,
> and the dump carries on to the next interface instead of stopping, so
> userspace silently sees an incomplete vlan list.
>
> Only fill the tunnel information when the vlan information was filled
> successfully.
>
> This was flagged as a pre-existing issue in the Sashiko review of the
> net-next series, which noted that the VLAN fill result is overwritten
> before it is tested (see the Link tag below).
>
> Fixes: efa5356b0d97 ("bridge: per vlan dst_metadata netlink support")
> Link: https://lore.kernel.org/bridge/ed1de95e-e112-4076-93f0-6f7668e657ad=
@blackwall.org/T/#u#5
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
