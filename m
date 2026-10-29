Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297090;
	b=YowNDxV7oZAInhY0VGEfxoorK2Omflnz/XA51Hymyc3UXmSlVNVAPi+SRJbzzSoSSZ1V
	 9HNZW88Nr319qs0n9ZuMScCuaL7bQ+4/fmH92djnXYdiJ377NxC+vx7jITdeB0lUziNFW
	 9oiMLqMFxlsDf01biAyTCnAhw/dAL2TpFHWhtEkFbMB2IgszDK7BJHo9KcnOJ575pGkal
	 nU4UOmyPkzyWZHuID/9DVnYqP81gc8M7b6/NkF58M/xokIpcz/S7qosHovXTUWYIOHc+G
	 K5izJsyReZogFMsixk99/S+VgZAbcWprrKeuz+49eBHTmhMK+H6NKdT06h5g25EsPPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=pd1xh/DVxfwwhSTbzVwZx3Q9voU0CzQVoT6kK/+qlJ8=;
	b=ey3UOStzLPzeQqQ4q5ytiuYDMqcUOZSZJbpaUkVkn7qNicOamvytLJEeYJ5xm4+wON+z
	 GkGVPrOjE6wFYMg13Xh4YH8hT28AIecNJvzgRrfdjCxEhDb47deUQ9G70remiviXm+oYe
	 E7cjsXI/UjSrFt7upntNlRgJ7gikne2nHcztNDb1eKp6WCTltFTXtf0frQhCtTTnR72oe
	 edUCBhvsv/65shFofDSNcn/taq0lO8bAyubousbXqvGL9Zkuheog91JOKPRKuwz4ZYfyw
	 ElLYCjeFsq+qWmmAAxXnVbcUW61sJ8qmlkPE0UkMVn77jyzQkvvjVTvIQ1HTdoNQGAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z03R3KpX;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B6606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0B6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z03R3KpX
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9441591aa5cso91640685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297088; x=1793901888; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pd1xh/DVxfwwhSTbzVwZx3Q9voU0CzQVoT6kK/+qlJ8=;
        b=Z03R3KpXdWbKL2oHa0WmeCYMi9RS1E2HS5FytUoZ9RrzWkG9IubzpvAPUN+MV5zub6
         cqWsI6EXXV6mqdlFRbCTziGzl0tZx4zvlS3Ro1BTTQ+FsqDJrym5fU5NYNbwxjWTPr/t
         RaR5/H1I6jikalkaTDrAV/AXs+FB6PdAc7OSrsaNQwnIa+4quDQVsR7ccLVV4tdNMi1M
         /wXDhsssMqlQNk3t+Df20TM8CBgad9UfARtay3aEcQVrktdnntpL4BVTLzLAVPxOUgQp
         +YvfrnVflol+OIEej/C0aRzy6ZWsXR5pOfNcv55xUAq9tdcYBVQY9iIgQMk0H17OlXMU
         vGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297088; x=1793901888;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pd1xh/DVxfwwhSTbzVwZx3Q9voU0CzQVoT6kK/+qlJ8=;
        b=l3N/MlJMod41jnniiGBHLWlpu4eHT4FZpEoBI3X/kFV3DoTBvasrMT5HASe64UmM2L
         MdeaXMYyeMjk0AGXr3vCMnT4hNcO7rRj/mbmahLlJW2qSLdQka8vpmYGzt66PYq9ouGx
         yqQlvFS6SpoZMh6dLZfc+pxpoJPs102h4Adr+NXEWTdo4vWXbT9+BwcgNIC6yWs71QUN
         z5yySpXNYFQqXoCNDmPURWbEDjY4F7TlpzYKX+rQI+sd0Jvcs+d2XbQ9O/w9YcLSWAIf
         ggAw2eenJ65645vzJUDSeSKNE02p6LrAU4DfVXnZ8/6omt176AbOJH315QDz+HmXZNbp
         3r6w==
X-Forwarded-Encrypted: i=1; AKwUvBwKrMim7aFLVCv+gc4tfKiqv3gtWmpCPPa5iRreiaEoDZ1j1xN2PYrsKAOvItICTpKq0DqUc11F43B6l0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEEiPUKtZ3Vt59+rVHFRhYT6nWAjtxGK+K5rpKub6flRhTiB0Q
	7EiA7iuRiIcUMy6ihFMQVzkm7frhkHyArnbTp5DB196QmMuNlo0mJhaobNcMMwhX
X-Gm-Gg: AYBFou3Rv13TMOfSxJiswhMYDtU4TUprsWVTk158pxXs0rinbbzNg8bLPEGSKCxHojY
	pPOFtq2areqI3e/t8sRak4lbnl9+JkMbaEChgCGRmt7hdiC9Ofd/sB9ufhLasp0H/KzzUAS817J
	o7jPUqyv3c1FsS7YeEItnyeuAZyjuCZ/eqjth5Xd1FkzM4roZBch9dEEKA5pwmo3Dl75lfQ9VnM
	ziurtO0mv2kTnghQ3R14AZj2h4BoZUcTgWqlQNdvXV1JjsGa5z0ylRlSdhO13duETwtUreYS4UR
	P12NVS0ccz6AetA3uNhv1SlvqVIjwANDPwjb4iwHIJYcLNRkttzq24oEWGZe8iUhGQysk6Ey4bO
	QVUGCYfxDLD69sNUqpbkIRS+OBEDrP/dE5XlU/NZKbVoGUInur8lOlhQGJWopQvaUw5+ixWhvLK
	g+fpz71ZAIkBgQTGPeGV9+U2WSTrP1Oge/UFDbOlRqgheRfP6kZI7MWzcRVGvWkdjYk71PIVFY/
	Tr+gwdkSCMNaM8RDYN1e2mHaSOW4TyCRFRw5hr46tMNl4ldYTE3LnFxWJT93OHbsOeTKOouGq+Z
	ZHtf95VGc9oWLy1ZpL5zgRbBAhQNc2A7pOOOyxN0i/Euy6hHsK2/5YAQw9kCkw==
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id af79cd13be357-9441337e6c2mr506492385a.16.1793297088367;
        Thu, 29 Oct 2026 11:04:48 -0700 (PDT)
Received: from smtpclient.apple ([104.39.176.237])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944210e4449sm8115585a.5.2026.10.29.11.04.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 11:04:47 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] nfsd: shut down running servers in nfsd_net_exit()
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <64af740ee0e8a22c8cbc7abb32c7f659bed3faa0.camel@kernel.org>
Date: Thu, 29 Oct 2026 14:04:16 -0400
Cc: Chuck Lever <cel@kernel.org>,
 NeilBrown <neil@brown.name>,
 Olga Kornievskaia <okorniev@redhat.com>,
 Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>,
 linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8677C896-44D2-4904-B253-BD36FC24022B@gmail.com>
References: <20261026235626.649844-1-shuangpeng.kernel@gmail.com>
 <64af740ee0e8a22c8cbc7abb32c7f659bed3faa0.camel@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

Thanks for the review.

I agree with the comment about the __module_get() users: stopping the
server from nfsd_net_exit() only covers nfsd's own threads, while
fs/locks.c (via lm_mod_owner) and nfs_common/nfslocalio.c take
__module_get(THIS_MODULE) on the assumption that an active server
keeps the module alive, and nothing stops free_module() once
exit_nfsd() has started.

So v2 takes a module reference while a server exists instead, which
makes "rmmod nfsd" fail with EBUSY as it does while the nfsd
filesystem is mounted. The laundry_wq and cld notifier ordering
concerns go away with that, since exit_nfsd() can no longer run while
a server exists.

The remaining point, an exiting nfsd thread still running a few
instructions of module code after svc_stop_kthreads() has been woken
up, is a pre-existing window on the umount path as well and is the
same with or without this patch, so I left it out of scope.

I'll send v2 shortly.


> On Oct 27, 2026, at 06:48, Jeff Layton <jlayton@kernel.org> wrote:
>=20
> On Mon, 2026-10-26 at 19:56 -0400, Shuangpeng Bai wrote:
>> Since commit 924f4fb003ba ("NFSD: convert write_threads to netlink
>> command") the server can be started over netlink without mounting the
>> nfsd filesystem. But that mount was the only thing pinning the module
>> while threads run (commit f49169c97fce ("NFSD: Remove
>> svc_serv_ops::svo_module") removed the per-thread reference), and
>> nfsd_umount() is the only caller of nfsd_shutdown_threads().
>>=20
>> So when the server has been started via netlink, a plain "rmmod nfsd"
>> succeeds while the threads are still running. exit_nfsd() then frees
>> struct nfsd_net in unregister_pernet_subsys(), destroys the DRC slab
>> and finally unmaps the module text underneath the running threads:
>>=20
>>  BUG: KASAN: slab-use-after-free in nfsd_file_net_dispose =
(fs/nfsd/filecache.c:483) nfsd
>>  Read of size 8 at addr ffff888109fe92d0 by task nfsd/300
>>  Call Trace:
>>   nfsd_file_net_dispose (fs/nfsd/filecache.c:483) nfsd
>>   nfsd (fs/nfsd/nfssvc.c:957) nfsd
>>   kthread (kernel/kthread.c:436)
>>   ret_from_fork (arch/x86/kernel/process.c:158)
>>  Freed by task 311:
>>   kfree (mm/slub.c:6802)
>>   ops_undo_list (net/core/net_namespace.c:257)
>>   unregister_pernet_operations (net/core/net_namespace.c:1412)
>>   unregister_pernet_subsys (net/core/net_namespace.c:1459)
>>   cleanup_module nfsd
>>   __se_sys_delete_module (kernel/module/main.c:804)
>>=20
>> followed by a general protection fault in nfsd_cache_lookup() as soon
>> as a thread allocates from the destroyed drc_slab.
>>=20
>> Shut down a server that is still running for a net namespace in
>> nfsd_net_exit(), which is invoked for every net namespace when the
>> module is unloaded. nfsd_shutdown_threads() is a no-op when no server
>> exists, so nothing changes for the common case. As the laundromat
>> work is queued on laundry_wq until the server is shut down, destroy
>> that workqueue after unregister_pernet_subsys().
>>=20
>> To reproduce: start the server with nfsdctl (or any other netlink
>> client) without mounting the nfsd filesystem, then run "rmmod nfsd".
>>=20
>> Fixes: 924f4fb003ba ("NFSD: convert write_threads to netlink =
command")
>> Cc: stable@vger.kernel.org # v6.10+
>> Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>> ---
>> Tested on top of 7.3-rc7 with KASAN and with PROVE_LOCKING: with the
>> server started over netlink and an NFSv3 request in flight, "rmmod =
nfsd"
>> now waits for the request to complete and unloads cleanly; starting =
and
>> stopping the server via netlink and via the nfsd filesystem still =
works.
>>=20
>> An alternative would be to take a module reference while a server
>> exists so that rmmod fails with EBUSY, as it does while the nfsd
>> filesystem is mounted. Stopping the server in nfsd_net_exit() seemed
>> simpler and mirrors what nfsd_umount() does, but I am happy to rework
>> it if the other behaviour is preferred.
>> fs/nfsd/nfsctl.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
>> index f32311f2d7cf..0a9679114b58 100644
>> --- a/fs/nfsd/nfsctl.c
>> +++ b/fs/nfsd/nfsctl.c
>> @@ -3113,6 +3113,7 @@ static __net_exit void nfsd_net_exit(struct net =
*net)
>> {
>> struct nfsd_net *nn =3D net_generic(net, nfsd_net_id);
>>=20
>> + nfsd_shutdown_threads(net);
>> kfree_sensitive(nn->fh_key);
>> nfsd_net_cb_shutdown(nn);
>> nfsd_proc_stat_shutdown(net);
>> @@ -3200,9 +3201,9 @@ static void __exit exit_nfsd(void)
>> remove_proc_entry("fs/nfs", NULL);
>> genl_unregister_family(&nfsd_nl_family);
>> unregister_filesystem(&nfsd_fs_type);
>> - nfsd4_destroy_laundry_wq();
>> unregister_cld_notifier();
>> unregister_pernet_subsys(&nfsd_net_ops);
>> + nfsd4_destroy_laundry_wq();
>> nfsd_drc_slab_free();
>> nfsd_lockd_shutdown();
>> nfsd4_exit_pnfs();
>=20
>=20
> I think I'm OK with either behavior (shutting down threads on rmmod or
> taking a reference), but sashiko has some comments on this patch that
> should be addressed:
>=20
> =
https://sashiko.dev/#/patchset/20261026235626.649844-1-shuangpeng.kernel%4=
0gmail.com
>=20
> --=20
> Jeff Layton <jlayton@kernel.org>

