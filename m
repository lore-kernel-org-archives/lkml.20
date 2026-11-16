Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837320;
	b=Xl3pAazNLRAF48bneUS0g2q8aATN1y02/APbEhIJ4iotbU0dPZ1WBpchDncfWYn/nmCR
	 dE54oA/iXp1/DruWDXB5XWDAAX0EEglbJoJYS7S6ftOOMsK+Ll9b3sIYnCekY20lIp+mG
	 LL7U85s4KLXrGYfL2BuwGeN9gPnbZt0m82NabIpvW/XSzDxK1NA/zRL3hCtEK0zILd4P/
	 wuNpb9hzqywhEHGEqj+MYGSSmBqlbu8kFQyZP5YapNOPGc3ILkJml4ZxZlgMlO3anuEfF
	 bzKGLL/mcmcEJu8hkQwBcb8Efv3Dsod5Ce162NGPOfN9YrVobHIHrfHC/gh7x6ABitg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837320;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ae+gBfveFRe7bl9Q9FwIWcr6AmqQ7n5Etc97cPv607U=;
	b=rNeHa7KDr2k+UncieApczCjci99Ta1hVjY4DaidFPs3oWwSN6qD/oMZPjkYZEcpCBJAJ
	 wupBaHmgpfVzInaZWj7ZTGIbdZhPBrSGpRwdocMOCP0CtewaLdnzt/u2QIqMb1zxsL7gG
	 HQQmu4In8w5AAZYsWXeDJeqbD8nimt8yHiCC+MXG2QYjuUDBJM+JrLb3CarNsbsJP2hl4
	 ngD5Yo/LWjyrWSXdYkQk7NMk1l55U5FjG9D8ZA4Cxk4FojUpgRNCdxcoivqNd+qqOTYSF
	 BcdAYTK7NTKYoxa01/Vc+DiWF15N34tNX7nEw65iG74bhFKCxxYPA1KgwbhEpldnwgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhbW3sEg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2260A5BE3;
	Mon, 16 Nov 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhbW3sEg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18A01F000C4;
	Mon, 16 Nov 2026 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837320;
	bh=Ae+gBfveFRe7bl9Q9FwIWcr6AmqQ7n5Etc97cPv607U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mhbW3sEg/cp7TzUsYRFrQL01AbQuFjPNOEF0FS14UtZ8PJWe36/J9qM90x4jMKXvC
	 Yf6taLep4im4XXCCW5UhEd6GM5Xnl7gTXZsdYcmSkxFsZaHSgr8IwvTKQGAmQMZO9g
	 ZaR3Tbv4zHtjvW8H2cY7VsnG6+iFdNSuqVWeXhqX73BqdfdqQaoOiKG8OvFQV1BsS8
	 pob1RLHypyzo2KsSoZWZjzcuEHiZqVlPA0KN38d3DubhJiM8gqqf8UfxLAsgiYZPI8
	 nh3eO0sP3XiCBZBdoEPLn19E2+8ixgTleg0kPWw7BAYFNNhcs3tuMcoVWmWJ5Ma5Yv
	 0bKpjuVKrw5aQ==
Subject:
 Re: [PATCH net 5/5] net: wwan: iosm: validate the command parameter length
From: netdev-bot+sashiko@kernel.org
To: fangxy@xiaopeng.com
Cc: loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 netdev@vger.kernel.org, johannes@sipsolutions.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, maoyixie.tju@gmail.com, horms@kernel.org,
 m.chetan.kumar@linux.intel.com, zhugl3@xiaopeng.com
Date: Mon, 16 Nov 2026 13:55:19 +0000
Message-ID: <179483731920.3136.4345864455275657786@kernel.org>
In-Reply-To: <20261112125201.1019-6-fangxy@xiaopeng.com>
References: <20261112125201.1019-6-fangxy@xiaopeng.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In ipc_mux_dl_cmd_decode() (MUX Lite path,
  drivers/net/wwan/iosm/iosm_ipc_mux_codec.c:338-345), once cmd_len >=…
- [Low] This commit is tagged 'Cc: stable@vger.kernel.org' (Fixes:
  9413491e20e1) but depends on the preceding series commit "net: wwan:…

--

net: wwan: iosm: validate the command parameter length

This patch works out a parameter length for each received DL command. For
MUX Lite it comes from cmd_len. For aggregated blocks it comes from
next_cmd_index, or from skb->len for the last command. The union member
each command type uses is checked against that length. A parameter that is
too short returns -EMSGSIZE, the callers drop the command, and in the
aggregated path the walk of the command chain stops.

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c b/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> index aea4cd9ec20d3..bd6c82746cc4a 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> @@ -185,6 +185,7 @@ void ipc_mux_netif_tx_flowctrl(struct mux_session *session, int idx, bool on)
>  
>  static int ipc_mux_dl_cmdresps_decode_process(struct iosm_mux *ipc_mux,
>  					      const union mux_cmd_param *param,
> +					      size_t param_len,
>  					      __le32 command_type, u8 if_id,
>  					      __le32 transaction_id)
>  {

[Severity: Low]
This patch has Cc: stable and Fixes: 9413491e20e1. Its context, though,
depends on the earlier series patch "net: wwan: iosm: pass the DL command
parameter by pointer", which has neither a Cc: stable nor a Fixes: tag.

In the stable trees, ipc_mux_dl_cmdresps_decode_process() still takes
union mux_cmd_param by value, and the callers pass cmdh->param. The
prerequisite also introduced two things this patch changes:

  - the acb->got_param = *param line removed here
  - the ipc_mux_dl_acbcmd_decode() body rewritten here

So this patch won't apply on its own.

Suppose the length checks are adapted by hand onto the by-value signature.
Each call would still copy the full 12-byte union out of the skb before
param_len is checked, so the over-read this series removes would remain.

The fix also relies on "net: wwan: iosm: bound the ACBH command chain
walk" and "net: wwan: iosm: validate the MUX DL block length".

Could the prerequisite be tagged for stable as well? Alternatively, the
prerequisite annotations from Documentation/process/stable-kernel-rules.rst
would make the ordering clear to backporters.

[ ... ]

> @@ -315,19 +329,36 @@ static int ipc_mux_dl_cmds_decode_process(struct iosm_mux *ipc_mux,
>  static void ipc_mux_dl_cmd_decode(struct iosm_mux *ipc_mux, struct sk_buff *skb)
>  {
>  	struct mux_lite_cmdh *cmdh = (struct mux_lite_cmdh *)skb->data;
> +	size_t hdr_len = offsetof(struct mux_lite_cmdh, param);
> +	size_t param_len;
>  	__le32 trans_id = cmdh->transaction_id;
> -	int size;
> +	u16 cmd_len;
> +	int ret, size;
>  
> -	if (ipc_mux_dl_cmdresps_decode_process(ipc_mux, &cmdh->param,
> -					       cmdh->command_type, cmdh->if_id,
> -					       cmdh->transaction_id)) {
> +	cmd_len = le16_to_cpu(cmdh->cmd_len);
> +	param_len = skb->len > hdr_len ? skb->len - hdr_len : 0;
> +	/*
> +	 * A cmd_len below the header is not a usable declaration: the
> +	 * received length stays the limit, as for a legacy device.
> +	 */
> +	if (cmd_len >= hdr_len)
> +		param_len = min_t(size_t, param_len, cmd_len - hdr_len);
> +
> +	ret = ipc_mux_dl_cmdresps_decode_process(ipc_mux, &cmdh->param,
> +						 param_len,
> +						 cmdh->command_type,
> +						 cmdh->if_id,
> +						 cmdh->transaction_id);
> +	if (ret == -EMSGSIZE)
> +		return;

[Severity: Medium]
Can this bound reject MUX Lite commands that were handled before?

Once cmd_len >= 16, param_len becomes min(skb->len - 16, cmd_len - 16).

Take a FLOW_CTL with cmd_len 0x10 (the header-only minimum mentioned in
the commit message) or 17..19. It ends up with param_len < 4. The new
check in ipc_mux_dl_cmds_decode_process() then returns before the existing
backward compatibility branch runs:

	if (param_len < sizeof(param->flow_ctl))
		return -EMSGSIZE;
	...
	if (param->flow_ctl.mask == cpu_to_le32(0xFFFFFFFF)) {
		/* Backward Compatibility */
		if (cmd_len == cpu_to_le16(size))
			session->flow_ctl_mask =
				le32_to_cpu(param->flow_ctl.mask);
		else
			session->flow_ctl_mask = ~0;

That branch was added for MUX Lite in 9413491e20e1. There, size is
offsetof(struct mux_lite_cmdh, param) + sizeof(flow_ctl), so the branch
expects Lite FLOW_CTL commands whose cmd_len is not 20.

Before this patch, such a command was applied and acknowledged as long as
the mask was in the received bytes. With this patch, net_tx_stop and
flow_ctl_mask are left unchanged and no MUX_LITE_CMD_FLOW_CTL_ACK is sent.

An OPEN_SESSION_RESP with cmd_len 16..27 is affected the same way, even
when all 12 parameter bytes arrived. The chain is:

ipc_mux_dl_cmd_decode()
  ipc_mux_dl_cmdresps_decode_process() returns -EMSGSIZE
  return (silent)

The blocking ipc_mux_session_open_send() then runs out
IPC_MUX_CMD_RUN_DEFAULT_TIMEOUT and fails. The only message logged is
"OPEN_SESSION send failed".

It isn't clear whether shipping firmware uses these lengths. However, the
commit message says:

  the received length keeps the limit there, which preserves the handling
  the existing backward compatible code gives legacy devices

It also argues that cmd_len is not a hard bound on the aggregated path,
because the flow control decoder treats a mismatched cmd_len as a legacy
device. Wouldn't the same reasoning apply to MUX Lite, where that
compatibility code came from?

Should cmd_len bound the parameter only when it covers the member being
read? Or should the 16..19 and 16..27 cases at least be logged and
mentioned in the commit message?

> +
> +	if (ret) {
>  		/* Unable to decode command response indicates the cmd_type
>  		 * may be a command instead of response. So try to decoding it.
>  		 */
> -		size = offsetof(struct mux_lite_cmdh, param) +
> -				sizeof(cmdh->param.flow_ctl);
> +		size = hdr_len + sizeof(cmdh->param.flow_ctl);
>  		if (!ipc_mux_dl_cmds_decode_process(ipc_mux, &cmdh->param,
> -						    cmdh->command_type,
> +						    param_len, cmdh->command_type,
>  						    cmdh->if_id,
>  						    cmdh->cmd_len, size)) {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112125201.1019-1-fangxy%40xiaopeng.com
