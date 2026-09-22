Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46F382381
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087801; cv=pass; b=IGosRr8NTWGHVfAENWPJd3P27CiofkvVdEPRPYZFBCTaU17OH0Lh10JzusOKXI8hn2FEN4MSiVpqGm4qcVHmG59vK31+PfA2JdX5MBbG5pdTgSESWQlqtBe+XkrGBc8MRMO+n2aHRMG129Qz9mP7Ofwg53LnFPYwZfZvg1ykg1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087801; c=relaxed/simple;
	bh=wm1mdUOdPY+A9xm9DAzxZQGN1bfMmm1ggAop9ZSmO7M=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BMuAjQ+Xqh7rgwMlH8pLrxeHyUTlx0wzZkjvane9ZeNVT/9hnp6r9JeUQ0cMFqYGV9vrUILnVCV9BNGQpPGKU/VQoNJv0uv1+h5z9J2nn3xthgNWSMGv/2JJ5gQOaiY8S7DYO/wahM1Vk6NejXLX3nLhcHe6Uj05gYAEaiDlGyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W0HL8UT9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ko+8zSrf; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W0HL8UT9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ko+8zSrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790087799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Uhf7XUhU0j+LV6kdzlFblwsBGtqhh56gYh3J+aEB9A=;
	b=W0HL8UT9gY+eGHnOj4IHPkW2OKK/qZbX0ghSjAgOZYJPksoIhuDQL/IyMnM61nFIAkYS7F
	Uy5vbzUX6N71sQF9BaEF7N4hiYjWSrgcC+ShjLzrr0IRwTrlGlGAZ040tiLhV8ulK9rU9J
	FGazU8Ge1v+yZCPTsUivodrX72+rMto=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-qHpeHQhKOvixPJT4ExY-MQ-1; Tue, 22 Sep 2026 10:36:37 -0400
X-MC-Unique: qHpeHQhKOvixPJT4ExY-MQ-1
X-Mimecast-MFC-AGG-ID: qHpeHQhKOvixPJT4ExY-MQ_1790087796
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-671562ddec3so5311192d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087796; cv=none;
        d=google.com; s=arc-20260327;
        b=K8IyfjvzaBI/l7HQBrQ4bSieq31BG8UIljWhrQsx13iXfGyMAlJ4+f8Zp1MgiOCj1q
         4G9UXkiNGOK6mGIpitfiR4anfng889HxOOsOGTWhfpOz5jxSCvudxuPNC8ZBaMvo4pmc
         LLIPFj4j8PDmf409gH/BCQYMVx3U5hFJuIZm3tMgv0JVjnCNFvCG2J5BlLL7MxjHzm/v
         MHibTvqfE4Bb+sOAyYkWTkeS0OplSI+BEy2Oc0SIuwIQQ8EJG+WtE0ld76ojUj/D0aaV
         g0/9+OgzksGfwiBrZArmzEcdHbN3pzcz8BD5aMpbNhkpf/agWHMP7lMGjDiHPkJJprv4
         A6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=2Uhf7XUhU0j+LV6kdzlFblwsBGtqhh56gYh3J+aEB9A=;
        fh=X+qp0wEA/g9+DqB1nFB6tOrIk5y/9BMzHBaj26P1Ghk=;
        b=QagfKX/ekGNQIcEmaI1+EkavQXJos6+malZquRxcf+WVY975e1apFWMH2l7Z09anZZ
         AgM1hNBo4AILpRArLLWh14M7w8/Cnp5d/Q9Hl0nJqORg0V/IYTCRBm2CuBmI+B6VeWm/
         9ZXL3v+fZHtSOf/84oMqN3DPOT6sEjQZY9LWeIIzImQ+o4qeX3fKtdbDFQREp/NbjWhV
         ++e5u5zRuGm+Btx5B+vK5HArEEBVXQD5DXXMeyodZybQ5O5NnmGG0PZgrp3vi9gXhsN9
         MTlDtNt/LjFEA9eeMZaRTtgvvdiJoNrjiw0SWV+WcuxlUoLVE8fOEXUW5rAGuruw4uIU
         62nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790087796; x=1790692596; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Uhf7XUhU0j+LV6kdzlFblwsBGtqhh56gYh3J+aEB9A=;
        b=Ko+8zSrfc9PnbfrmyeJkWkATqFXVsKPb8HrObOj+fko6y/exiKq4/E0AZvxNBCpKgG
         ZyLrOnptoYa+Zz7xXHt9xthEfiWEqKbIrcGykRCJ01pQ97H+neNq48m7+pF8KTtX5XkT
         U0+Rd3H9gE6cqIJFpZw67fdgKz5M9bYgdpbJrCLLMuBS3h+rjrwedpXIZl7Z9ZuOYrFS
         ZcFDJxLm5TEy/YloUVMdqBNWUHK2rY7jxg3C8P9Pf7RDPV2xPq5DTSz3zgAmDWz7xGjJ
         7Dr0wkRmce/Ejy1yBQBppvbb5WN2lK0hT1AyjNTgcqZgTyk78qRxprwXs+Y78//4bG+J
         tDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087796; x=1790692596;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Uhf7XUhU0j+LV6kdzlFblwsBGtqhh56gYh3J+aEB9A=;
        b=EdmF2s25wi5aDR2G2lD1WgDMcghmS20n0P36S2U4lsQTTVQb3tlCBHQ3C/e6fMTjeE
         s/eAFkF9ov24wEeBVi7sUmRiJgDbn0gw3DdlMjbnt658naQIRQsAsllyr7HrqaZJa+sd
         N40sgm8BYP/dnecgQpHg4V+LufdF8Fycut6CxgUn2JSV43Ios/ZRnRqGNBY+n+5mC0fg
         NNpZB5AcE94pSStT7j32hirWWwy0Fp4qLshHgHZKQHuSLnjHPxjb6FDUta3/1uv11YIb
         KADB45QJY9zbSYm9NyqeFoTpE5u135neEZpnKxmSTX5pOrbZ0+PjMNpf+9088ULeZ7IT
         ADaw==
X-Forwarded-Encrypted: i=1; AKwUvByg5GspvGmmuiTEKieHE5CoCtlwkurP9Tpy0O3SOH5uzp6rcEgOsJ2T7+3Dst9dohxayBT2f7o7U6dmvR4=@vger.kernel.org
X-Gm-Message-State: AFuF++m1bZGQhI14DkXMut1PKTiBq1SgzIHP2FYR6BZPQAmqxO0syI1o
	xeFhLPF4VKkos896a13enPRy9Fy/du94tIuqHSb7YTCCyabH5WZE0IvI70D5PpU1x0aTnF+sH3s
	UVLGG+mMe3Vyj5z1ZAVnyrIp+8X962jB92pSiFAgsyRrwUyTCKKHjKz3JzT88wTmFpsA30WFgxj
	0KtxP/YFMrTkg7fOLcrj5K5rAh1LYHqvPc7OfDsRjZ
X-Gm-Gg: AYBFou0+cFLsaO3qDI+7juJUzPwl4FqFqpc75gSD/fSVJubrbqLcSiMUN+g6BitFQIm
	HqM69lcLNh7giNqGOame92ZqZVR9/KiPkuk0KRQuX3YQ5J3TPFCFlaAynxRp1RCjjvJajQCpmSg
	lRL5l8c+Fb7cbyEw5wgFAwZ1gGVnvLP4ajCvMkm+9DlE4iWt0L7bNMzsU=
X-Received: by 2002:a05:690e:168a:b0:672:c55b:6bec with SMTP id 956f58d0204a3-672c55b76b1mr1250006d50.5.1790087796464;
        Tue, 22 Sep 2026 07:36:36 -0700 (PDT)
X-Received: by 2002:a05:690e:168a:b0:672:c55b:6bec with SMTP id
 956f58d0204a3-672c55b76b1mr1249970d50.5.1790087795940; Tue, 22 Sep 2026
 07:36:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 10:36:32 -0400
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 10:36:32 -0400
From: =?UTF-8?Q?Adri=C3=A1n_Moreno?= <amorenoz@redhat.com>
References: <20260921101538.97286-6-johannes@sipsolutions.net>
 <20260921101538.97286-9-johannes@sipsolutions.net> <98b93c98-21ae-4248-a60a-9625a20508ad@kernel.org>
 <7f557f5a-b21e-45cc-9d3a-cd4f8b5f799b@ovn.org> <99e5f7c0d7debc8a59bac96e93f09600bf488ca8.camel@sipsolutions.net>
 <4a0240a7b9ff87302620a95c73f4f265cd428618.camel@sipsolutions.net> <dca799b4-23f5-4b6f-be73-bad5a3d88007@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <dca799b4-23f5-4b6f-be73-bad5a3d88007@ovn.org>
Date: Tue, 22 Sep 2026 10:36:32 -0400
X-Gm-Features: AclHuK_WQy-H4M9Vjbwisdq6E74XDMCt0MUm8uA9loRbh4lJmNGD-_684UY2a9A
Message-ID: <CAG=2xmOuz6JEqZROE26nHEq5MgwTBNU_PvSqw1sn1MzAohotWg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] net: dropreason: use new __print_sym() in tracing
To: Ilya Maximets <i.maximets@ovn.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Matthieu Baerts <matttbe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Aaron Conole <aconole@redhat.com>, 
	Eelco Chaudron <echaudro@redhat.com>, dev@openvswitch.org, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 22, 2026 at 11:01:10AM +0200, Ilya Maximets wrote:
> On 9/22/26 1:20 AM, Johannes Berg wrote:
> > On Tue, 2026-09-22 at 00:36 +0200, Johannes Berg wrote:
> >>
> >> Indeed. Something like this (untested right now, didn't manage to spin
> >> up a test yet):
> >>
> >> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> >> index a31f7fb6882d..9b8edfcd2d1a 100755
> >> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> >> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> >> @@ -234,7 +234,7 @@ ovs_drop_reason_count()
> >>  	local reason=$1
> >>
> >>  	local perf_output=`perf script -i ${ovs_dir}/perf.data -F trace:event,trace`
> >> -	local pattern="skb:kfree_skb:.*reason: $reason"
> >> +	local pattern="skb:kfree_skb:.*reason: $reason$"
> >>
> >>  	return `echo "$perf_output" | grep "$pattern" | wc -l`
> >>  }
> >> @@ -790,15 +790,6 @@ test_psample() {
> >>  # - drop packets and verify the right drop reason is reported
> >>  test_drop_reason() {
> >>  	which perf >/dev/null 2>&1 || return $ksft_skip
> >> -	which pahole >/dev/null 2>&1 || return $ksft_skip
> >> -
> >> -	ovs_drop_subsys=$(pahole -C skb_drop_reason_subsys |
> >> -			      awk '/OPENVSWITCH/ { print $3; }' |
> >> -			      tr -d ,)
> >> -	if [ -z "$ovs_drop_subsys" ]; then
> >> -		info "failed to get OVS drop subsys ID"
> >> -		return $ksft_skip
> >> -	fi
> >>
> >>  	sbx_add "test_drop_reason" || return $?
> >>
> >> @@ -842,7 +833,7 @@ test_drop_reason() {
> >>  		"in_port(2),eth(),eth_type(0x0800),ipv4(src=172.31.110.20,proto=1),icmp()" 'drop'
> >>
> >>  	ovs_drop_record_and_run "test_drop_reason" ip netns exec client ping -c 2 172.31.110.20
> >> -	ovs_drop_reason_count 0x${ovs_drop_subsys}0001 # OVS_DROP_FLOW_ACTION
> >> +	ovs_drop_reason_count OVS_DROP_LAST_ACTION
> >>  	if [[ "$?" -ne "2" ]]; then
> >>  		info "Did not detect expected drops: $?"
> >>  		return 1
> >> @@ -859,7 +850,7 @@ test_drop_reason() {
> >>
> >>  	ovs_drop_record_and_run \
> >>              "test_drop_reason" ip netns exec client nc -i 1 -zuv 172.31.110.20 6000
> >> -	ovs_drop_reason_count 0x${ovs_drop_subsys}0004 # OVS_DROP_EXPLICIT_ACTION_ERROR
> >> +	ovs_drop_reason_count OVS_DROP_EXPLICIT_WITH_ERROR
> >>  	if [[ "$?" -ne "1" ]]; then
> >>  		info "Did not detect expected explicit error drops: $?"
> >>  		return 1
> >> @@ -867,7 +858,7 @@ test_drop_reason() {
> >>
> >>  	ovs_drop_record_and_run \
> >>              "test_drop_reason" ip netns exec client nc -i 1 -zuv 172.31.110.20 7000
> >> -	ovs_drop_reason_count 0x${ovs_drop_subsys}0003 # OVS_DROP_EXPLICIT_ACTION
> >> +	ovs_drop_reason_count OVS_DROP_EXPLICIT
> >>  	if [[ "$?" -ne "1" ]]; then
> >>  		info "Did not detect expected explicit drops: $?"
> >>  		return 1
> >>
> >
> > No longer untested, that works.
>
> Looks nicer than parsing obscure numbers indeed!

+1, way prettier indeed.

>
> Matthieu mentioned we'll need CONFIG_TRACEPOINTS in the selftest config
> shard: tools/testing/selftests/net/openvswitch/config
>
> Is that a new dependency or was it always there we just missed adding it
> to the config before?  (it's included in the common net config, so that
> is probably the reason why CI doesn't fail)
>
> Best regards, Ilya Maximets.
>

