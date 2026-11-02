Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793654793;
	b=f2I0TfyMv7UcbXl6UjOGV5bxh/uAAXSsHOB8aKLC27Pc1wO7+GaMJ8hEQjEYj6w4ayBq
	 bxR6aKR/ek0TflEKz/8m6kNglPIFam5po2tUhuJJShYMPsjWYBjDnQY8kyNMug0sXgQyF
	 lQSJzCD80uonNoD43+i/BrZGpleLFF0HHLTpW++WRADCiBYgm1qPrskFK7G/yELs3U3Jj
	 9Y5ZaVGCgW5BtFsShEl8mkWc04SVrf9NEjaRGC5ZEdnFtkQsIUiaCnJ0VSS47egPC4hsL
	 a0fanFSH0HQWWVu8vlVv8TLis5ICxme+MQP/JkDZ41KBVPgvP2BBP+Jjps1sGHVUUvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VQNxh4E09UbuTnsPgF35Q2gxnGUXI30LdDtVm+7397g=;
	b=NgqyBDNTjpHCqIk94ntESys85aUTH3dVIFM8imXs2DwlgA1BT37ezU0C9ip0LRZWgPt5
	 nG4vIcIR9854ZWN/ckN8IWC6vt1Ecy6osg084sYZhPV7bCJpq9OVJfCQgTV9RjWPFv9nX
	 cV67uJTyco8JEMcoQ4tCOb1YKpK0diWJxYyiNXWmlUhu+MLuSZS1TBxICpcSVQaAetm5i
	 lKRsID4EfNOayvijsb2WzmnuYzOXJ84t/bSoyY8XGsV1cGodMSMX7psmf9Ul47yF3CYWO
	 TM4MZ1kUF7blXyxwt5N+bLxERxWtONdftQZTaGyfQr86TAQRp5882ChmTiA95EeR5rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=F9v8zzb8;
	arc=fail smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766CD606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 766CD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=F9v8zzb8
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ec6f271883so2270865e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654791; cv=none;
        d=google.com; s=arc-20260327;
        b=LcTtanggej7QlPMESfaKbIoxkufSrsTlEtM4HEPvVGf1B26q0tbN9nHtwYOVQDN3zb
         OVo6qLYPe3ZSIPuymyu8kif7FZ04zkKOYns8VC+O04QwR7LRtEKpjEoBv3XyBdS/ShFY
         LRO7ljruz82HdkgePdZ76JZR++n3Mar9eWxbUOn1hwHfqvdhylzn+KrLROtICUMIuVm8
         hcLcNGx12zbrM5xYXQVH5XmUidyyNrytvbcrcGBNKonwVfEaC6xQRnDvSpe7ya5ckq3h
         gqkZ1QfsnOUjUE1fh2zE0zUYKTuYD37crUOzJ0X32Eqyyb0hCwaw8TITz345vVxfi/Fy
         BHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VQNxh4E09UbuTnsPgF35Q2gxnGUXI30LdDtVm+7397g=;
        fh=aclo9x9TF8KwSs33hyRa9/DMTUUaV1qiVw0HGqN5Grg=;
        b=X7dEIto631sYxQIGLXP5HVvmBb9znd8BHcueONRUVK+3Ay1QXclbPNhwMg3rIyBqsQ
         6oooMgUeUzWARfj6ck6QsLXwGVfrzq3smG1+tlOx6bNe7nWjAwVarhjMT9xzSwlzYqfi
         Y+834BrryJg/phKG8aULJMtx1wqgBBA8IEyNKoikTJDVcQCdFMPMNzKEtX721bKH1Cdb
         0TLQkpdDyqWPHqH9ILGczsImSjg55Gqy37guduwNl2H8iSNXOHgVq2AKofHNIbT2r+Iq
         wrYqkxrkHZxUmXIN5xf4YBDUiQebNzJDxAI9fQa28tqSuazgGFvqVsq+pYd63AuHTMYo
         Mpew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793654791; x=1794259591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VQNxh4E09UbuTnsPgF35Q2gxnGUXI30LdDtVm+7397g=;
        b=F9v8zzb8mKIHR1ATsY4VGzyv5czZzBfUwihwBvEStbjd6IGaWOxvgBy7wXEA5iyGWM
         EXnQMDfibX7Lx4z/pBy8K8kQLNHIaJq4IRjMNheDHttYW/qEZlb9V67Y5jwEFjjrEI7K
         xcHDVD1rQXg6wFypM8kP6b9Pa7JS6azZgs55ZDDOsM4AVgXaWCIW9EQMtgqCPWt63qAX
         +ncHbGFd/X4s4vGvt3eGZN10yzYycx/+h9QG7B2n6YdnA5P78UyNNqMWnXVcKxl7HY5q
         5zVK+g+tadIXx4gye0wlKBoK6prcvm1ems2RmO8PQpWZJiJYsyIlKreIkQf7jpaD5RRo
         uq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654791; x=1794259591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQNxh4E09UbuTnsPgF35Q2gxnGUXI30LdDtVm+7397g=;
        b=DM8Pf8qwXxowrSkAQIXE8M8OoBIRjEqP7KzXUCPdKqvaEbThtwYpnm9cq3lRplBP8q
         CczkCtRxhg1172dtUW8ZJOulK9fINcKVxdA/0qRMAH6i0fBUdUCa+p5E+bSzHHhBkTEt
         Mv+7usvqd5Ol/bJXEKGDkEU9vHfFmxaLHfWw9EHvj8iZ6o65EEqfT4FVxEirEMIFN0tY
         JjvtXUvj9+yCQMRr6NCQVKM3O1p/9Lp4rCtiQmc7ImW/0B/SqiuhhwzauL0NpLa7Rojf
         k4SILQFcYD+H3e5ceMObd1dyKLiqeZGCDBarjOYdOB1i3VtejRyIIBMD51RpQZYUt7GY
         ElZA==
X-Forwarded-Encrypted: i=1; AKwUvBy5vMXgnGFfUYdA2yjv7M3tnOPkTKsrmg9uCtHycOAkAIOcv4/izllmAsTE/y3dRht1lzJGMw3Yk9q2Kjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qyNK4maYcRN9tRZ2IJC1rewCXR2hyrmhCsQ9V/hQ3+C6XoBOt
	2ZnE2EpUkPv1EFlXYagJc9gVdyBOak4Qf8cjNpmRi2a8RbOxk6g7hzoBZksYVWmpoJUizAapdh7
	cnTfLTqRVPHIp8O9StgPr9Vu0w+AwCyH37eVtCIfYcA==
X-Gm-Gg: AYBFou1VFKJrTptsNVCM3tY6VXTvrAjAJda2oZlUUuS4rGkepYjUui+xGfeHOGvVYxE
	XyBW3qvFT2yLmJdfgiXLSTWvH8hYiQ3s4kEA6zvimcuRCXh7Y9f3rimPkt6TUOWXf95BO/4SgIE
	tkIoBPImNsUIt/Twm7wI45QJ+qggmWNZm0KjT5WCV5HsChQWb42qUg9MHeSdcTI0M33VSiKsuAg
	mtFFE8czGDAgAjSzuYz/D/csvOTlGZwWTdpf3F+1W1D1hwd2oj6NvCWH3m3eez4dsB1z6z3LwBM
	8XRODFv/a7gcwZHQ34U4qujf9/5ZlTv8LvG3mEC2eHaIofrMqzziTcFzxjxKa6px8o8ipzMHb79
	2HMVbma4v47t0ZI7CfPb3CxSJlbO4Jd9dXjpP63BQA1T1whfE3dCenefLNg/DN9sC278jGy/pgc
	a93IvspPvxCg2PsnzfxCEd2t/J3nxMlXfDlcjICOKPywEn4O5cr9ApusB1keYz8/lcI705d9Z0G
	/S7taeuYoEeOp4oSQ8VE5v4
X-Received: by 2002:a05:6122:21a3:b0:5cd:590:c22e with SMTP id
 71dfb90a1353d-5ec689aed88mr5219637e0c.21.1793654791273; Mon, 02 Nov 2026
 13:26:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029172302.2944955-2-rjethwani@purestorage.com> <179364254636.3131.4069372250703759332@kernel.org>
In-Reply-To: <179364254636.3131.4069372250703759332@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 2 Nov 2026 13:26:20 -0800
X-Gm-Features: AclHuK9nHLnDMQvP2qQAOwulgJKfpc9JDvd1vD557sgt5xdTi1XrzG5V8Azu63g
Message-ID: <CAKaoeS1rw1pB953evvE4H6LC2jTANtJzRWW5kUsteOKOrmDCJg@mail.gmail.com>
Subject: Re: [PATCH net v4 2/2] selftests: net: add TLS 1.2 hardware offload tests
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, john.fastabend@gmail.com, 
	kuba@kernel.org, sd@queasysnail.net, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, ilyal@mellanox.com, borisp@mellanox.com, 
	aviadye@mellanox.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:02=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The tls12_aes256 variant of test_tls_offload
>   (tls_hw_offload.py:280) requires HW offload in every DUT direction=E2=
=80=A6
> - [Low] Two comments say both helpers' stdout pipes are only drained
>   after the helper exits: run_tls_test() in tls_hw_offload.py ("Both=E2=
=80=A6
> - [Low] When 'Rx' is in tls_hw_directions, check_hw_crypto() asserts that
>   rx_tls_decrypted_packets grew by at least 1, but nothing makes the=E2=
=80=A6
>
> --
>
> selftests: net: add TLS 1.2 hardware offload tests
>
> This adds a two-node kTLS hardware offload selftest. A C helper installs
> fixed AES-GCM keys on both ends; the DUT runs the client and the peer
> echoes the data back. The test checks the TLS MIB counters and the NIC's
> ethtool -S TLS counters to confirm HW offload was used in each enabled
> DUT direction, and it adds handshake and alert record-type regression
> cases.
>
> > diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py b=
/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> > new file mode 100755
> > index 0000000000000..78fa764a6ef3f
> > --- /dev/null
> > +++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> > @@ -0,0 +1,321 @@
>
> [ ... ]
>
> > +def check_hw_crypto(cfg, nic_before, nic_after, hw_directions):
> > +    """Check DUT NIC offload-path packet counts and initial key instal=
ls."""
> > +    for direction in hw_directions:
> > +        names =3D HW_NIC_COUNTERS[direction]
> > +
> > +        key =3D names['crypto']
> > +        if key in nic_after:
> > +            got =3D stat_diff(nic_before, nic_after, key)
> > +            ksft_ge(got, 1,
> > +                    comment=3Df"DUT {direction}: NIC reported no TLS "
> > +                            f"offload packets ({key}=3D{got})")
>
> [Severity: Low]
> When Rx is in hw_directions, can rx_tls_decrypted_packets stay at 0 after
> a short run, even with working hardware?
>
> Nothing waits for the device RX context to become active before the
> peer's echoes arrive. On mlx5, mlx5e_ktls_add_rx() bumps rx_tls_ctx
> synchronously and returns after post_rx_param_wqes(). The steering rule
> that sends the flow to the TLS TIR is installed later, from a workqueue:
>
> mlx5e_ktls_handle_ctx_completion()
>   queue_work(rule->priv->tls->rx_wq, &rule->work)
>     accel_rule_handle_work()
>       mlx5e_accel_fs_add_sk()
>
> Until that rule is in place, records are decrypted in SW. TlsRxDevice
> still grows, but mlx5e_ktls_handle_rx_skb() only bumps the counter on
> the HW-decrypted path:
>
>         case CQE_TLS_OFFLOAD_DECRYPTED:
>                 skb->decrypted =3D 1;
>                 stats->tls_decrypted_packets++;
>
> If the rule lands mid-stream, a resync is also needed before HW
> decryption starts.
>
> client_connect_tls() starts sending as soon as TLS_RX is installed, and
> cfg.wait_hw_stats_settle() only runs after the traffic has finished.
> Could the small_buf variant (100 round trips of 512 bytes) finish
> entirely inside that window and report a false failure?
>
> This depends on firmware command and workqueue latency, and the commit
> message reports passing runs on ConnectX-6 Dx, so it may only show up as
> an occasional flake.

Agreed that on mlx5 the rule is installed asynchronously after the
context is created.
I haven't seen this on ConnectX-6 Dx across repeated runs.
If it does flake, the failure is visible and attributable, and I'd
rather not add a sleep or a skip.

> [ ... ]
>
> > +    # Both helpers run with their stdout captured in a pipe that is on=
ly
> > +    # drained once they exit, so the helper keeps its per-connection o=
utput
> > +    # small (see the note on verbose in tls_hw_offload.c); do not pass=
 -V.
>
> [Severity: Low]
> Is this comment accurate for the local client?
>
> Only the remote server is started with bkg(), so its ssh pipe is not
> read until bkg.__exit__() calls process().
>
> The client runs in the foreground via cmd(client_cmd). In the non-backgro=
und
> case cmd.__init__() calls self.process() right away. _process_terminate()
> then uses self.proc.communicate(timeout=3Dtimeout), which drains stdout a=
nd
> stderr while it waits for the child to exit.
>
> The comment on verbose in tls_hw_offload.c makes the same claim:
>
>   /* Per-iteration progress output (-V). Off by default: the
>    * harness captures stdout in a pipe that is not drained until the help=
er
>    * exits, ...
>
> The -V restriction still makes sense for the server. Should both comments
> say that only the background server's pipe goes undrained?

Good catch. The foreground cmd() drains through communicate(),
so only the bkg() server's pipe goes undrained. I'll fix both comments.

> > +    #
> > +    # Both helpers exit on their own within HELPER_TIMEOUT_S (see
> > +    # tls_hw_offload.c), so nothing outlives the variant even on failu=
re.
> > +    with bkg(server_cmd, host=3Dcfg.remote, exit_wait=3DTrue):
> > +        wait_port_listen(port, host=3Dcfg.remote)
> > +        cmd(client_cmd)
>
> [ ... ]
>
> > +@ksft_variants([
> > +    KsftNamedVariant("tls12_aes128", "128", "1.2", "4"),
> > +    KsftNamedVariant("tls12_aes256", "256", "1.2", "4"),
>
> [Severity: Medium]
> Can the tls12_aes256 variant fail on hardware and a kernel that are both
> working correctly?
>
> check_tls_support() only looks for "tls-hw-tx-offload: on" and
> "tls-hw-rx-offload: on" in ethtool -k. Those flags don't say which
> ciphers the device accepts, and several in-tree drivers only handle
> AES-GCM-128:
>
>   nfp: nfp_net_cipher_supported() returns false for anything except
>   TLS_CIPHER_AES_GCM_128, so nfp_net_tls_add() returns -EOPNOTSUPP
>
>   chcr: chcr_ktls_save_keys() only handles TLS_CIPHER_AES_GCM_128
>
>   funeth: fun_ktls_add() returns -EOPNOTSUPP for anything except 128
>
>   mlx5: mlx5e_ktls_type_check() checks a separate firmware capability
>   for 256:
>
>         case TLS_CIPHER_AES_GCM_256:
>                 if (crypto_info->version =3D=3D TLS_1_2_VERSION)
>                         return MLX5_CAP_TLS(mdev,  tls_1_2_aes_gcm_256);
>
> When the driver declines, do_tls_setsockopt_conf() falls back to SW
> without reporting an error:
>
> net/tls/tls_main.c:do_tls_setsockopt_conf() {
>     ...
>                 rc =3D tls_set_device_offload(sk);
>                 conf =3D TLS_HW;
>                 if (!rc) {
>                         TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSTXDEVICE=
);
>                         TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSCURRTXDE=
VICE);
>                 } else {
>                         rc =3D tls_set_sw_offload(sk, 1,
>                                                 update ? crypto_info : NU=
LL);
>     ...
>                                 TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLS=
TXSW);
>     ...
> }
>
> check_path() then requires ksft_ge(dev, 1) for that direction and fails
> with "DUT Tx: HW offload not engaged (Device=3D0, Sw=3D1)".
>
> Would it make sense to skip this variant when the DUT falls back to SW
> for this cipher, rather than reporting a failure?

That's intended. A driver that doesn't support AES-GCM-256 offload
falls back to SW, and the test reports that as a failure.
Per Jakub's earlier feedback on this series, HW tests don't try to
skip for every device capability gap.
The automated triage separates regressions from failures caused by
missing support.

>
> > +    KsftNamedVariant("tls12_aes128_ip6", "128", "1.2", "6"),
> > +])
> > +def test_tls_offload(cfg, cipher, tls_version, ipver):
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261029172302.2944955-1-rjethwani%40purestorage.com

pw-bot: cr
