Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336946;
	b=5lP1IAdk5+fMFA/zXbrRSZ6MOS+bVQMY6HAN/2EsTf3UQ9ODUavcQ8gUzEus+sljRmze
	 ZVymUEXUnMkdBPOro7XQLS2cqdOBHmlPuv5GKPUurd58txZYQocsyi+HXIpSp2/sP5kAz
	 /XQQLMGZf2wwYgkolrMVtOFP+Hc8TEQtNMd/BEHvXjIGKc7GY0k7ueL/bH7VXSvcR4Evx
	 hyjtrirfvsYnIbUnTcVGHFRcv1uMT1kCen58i1H06xb47OkNQunPD0I14tDgJVQ/Lwsrr
	 T8bSBZrwSqBBc5BYK8k/Th+ENB/gxlqKEMnQtM2wsnUF1Thr2bPv9xZRt26NGgWhHnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336946;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=IzfYoPQXoRB3qOZZvQLmzwqUCwQZzYFyjEAkUcvztHE=;
	b=MPf3dps3w+W1yhV9C4P9SHjBA5kIC5qqa6v2FCPNqBQJrJYmMZ3klGL8cmud+pyuxwOj
	 R3MmhivR6J0MwOSKFU52+cwfzJ9moO0defe5sGcJa9iNygR+uSJuVpCbRtGcCQ05F8eXZ
	 kbQQSxzOrcWHt9yh7OXOmt1LJV7te5pYfh44aJSYKX4zS/vsNv/u+uoLzlCMrwxHzx11g
	 CrN1t9sjs5MZI/XYkHwAh2UPICuR5OHc/uIm0lrj9te5jTPmK2VtpyWoh90osEnVvDJpo
	 vjIBm9lLoct+8i6ZTk9BlHuirfGNoJwQ1bNJqb9w7nHW1IWmVnrIVGAzDnQQsOl+qEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=JIbPtDR1;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B1B606A326;
	Tue, 10 Nov 2026 18:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=JIbPtDR1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=IzfYoPQXoRB3qOZZvQLmzwqUCwQZzYFyjEAkUcvztHE=;
	t=1794336945; x=1795546545; b=JIbPtDR1L2obaS6rr5bxvBpgsYDuHUvx99TyX6dcQqobyEk
	lHhxT/RUxfgnXURTOyCFGkEMfsOD3ckUXdtICd/7W0Q53EUa03O6NgkBU21OXsPdvYX9JPer/b5d7
	bXfvIZTgUlH0bVBgIrohKpMZMAExH37E6/cGU3avRpnvQ17ma3hZZC+Lvi8XFJMOmrJXrrKJU09pA
	TARTKCnBDSo3pman+K7JeJD4Pmwkq8sHMomlrCCMMlZAsg4JmDZcgU+NGYvDZ62CdVGMfjfegjPTB
	ieTF7wdNyXyga3gcv2/hk5KSQRVYsjxrhbkQje35ajXuqtdsQwH+gNodAPcOXtXQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQr0Q-00000002BEf-0Zi5;
	Tue, 10 Nov 2026 19:55:42 +0100
Message-ID: <7e6a6640fe034af160eec0dda532259b499153ad.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 09/21] wifi: nl80211/cfg80211: add
 support for SMD context programming
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 19:55:41 +0100
In-Reply-To: <20261106-smd-v4-9-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-9-62e39487f51a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>=20
> +static int
> +nl80211_parse_smd_ctx_ba_params(struct nlattr *tb,
> +				struct ieee80211_smd_ctx_ba *ba_tids)
> +{
> +	struct nlattr *ba_tb[NL80211_SMD_CTX_BA_ATTR_MAX + 1];
> +	struct ieee80211_smd_ctx_ba *ba;
> +	struct nlattr *ba_attr;
> +	int n_tids =3D 0;
> +	int rem, tid;
> +
> +	nla_for_each_nested(ba_attr, tb, rem) {
> +		tid =3D nla_type(ba_attr) - 1;
> +		if (tid < 0 || tid >=3D IEEE80211_SMD_CTX_NUM_TIDS)
> +			return -EINVAL;
> +
> +		if (nla_parse_nested(ba_tb, NL80211_SMD_CTX_BA_ATTR_MAX,
> +				     ba_attr, nl80211_smd_ctx_ba_policy,
> +				     NULL))

if you set up the policies correctly (and you should, but I didn't go
back to check now) then you don't need the policy here

> +		ba->amsdu_supported =3D
> +			!!ba_tb[NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT];

it's not super useful to use !! to assign to a bool, and if you wanted
to be fancy you'd use nla_flag(), right? ;)

> +		if (nla_parse_nested(dl_tb, NL80211_SMD_CTX_DL_ATTR_MAX,
> +				     tb[NL80211_SMD_CTX_ATTR_DL],
> +				     nl80211_smd_ctx_dl_policy, NULL)) {

same here, and then it kind of cannot fail, I think

> +			nla_for_each_nested(sn_attr,
> +					    dl_tb[NL80211_SMD_CTX_DL_ATTR_SN],
> +					    rem) {
> +				tid =3D nla_type(sn_attr) - 1;
> +				if (tid < 0 ||
> +				    tid >=3D IEEE80211_SMD_CTX_NUM_TIDS) {
> +					GENL_SET_ERR_MSG(info,
> +							 "invalid DL SN tid");
> +					goto err_free_ctx;
> +				}
> +
> +				if (nla_len(sn_attr) !=3D sizeof(u16)) {
> +					GENL_SET_ERR_MSG(info,
> +							 "invalid DL SN len");
> +					goto err_free_ctx;
> +				}

You've got to be _kidding_ me, why do I even have to get see such
obviously redundant code?

Please read your own code.

johannes
