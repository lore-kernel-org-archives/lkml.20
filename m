Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400551;
	b=4k00utzyfOpqpQxBjt5NczFHgdGreMEilmdW7dG7YG8HDwaDcgg3acD7l9r5P6u8fXTk
	 AJpQC49TTwtjBD/zoJ1OVgf694gFovvwFtJkbrlaEPhhptItmCU38uCMrnT1jKgS+1ojf
	 SF6w6ReFMK7aPSUqy3RQ1JQoGgBLO1mkA2Ey5j+x/9fSWQ8PTzf7PUNmanyIh57Oz1xIl
	 fkcI0dAje6r7THByg/zEjaEj7Rq7cCa/DwnttkdN5b+KPq6zzlFepJSJ3Q504Yoc2iKnM
	 tuQ0KQoue35fBIizwq5eVibo+UwM2hA0kh3nlmz6w7wQUGsNFHCEzjQMShvtWgaYN6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400551;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=11jF/GSaAPTptgC+43mLEOCCQpvNHCe7mgdAslshHpw=;
	b=F/f8aV/3c5LoSnOMZTlOhzPHUka/CECzuvwh94Dz6WGJSg+24WDPyKd4s+7qK3zOlmTb
	 gZc9bu0ubrT3iLU0eKXstbWDoSS3X1eSPwe3U46QPwxAFaRmlQP66tjU7J0Nmo+aMQ4sC
	 Y3Q0T8jn35X2aHFgx2jQD32SEQAs5S8dqZqjGhDr8s/2dF2DM2J/eIo3qB+BPvfPsmCzk
	 xPq7wbNQt1fi50oSmj44k7EJ1eAZCDwwa6LqaSW9oYUbnGI/R4ofQgmUm72tZkCxe3PXH
	 nRgfEKz5T0JzZD2+XEuFbwcjGzWajeiGluFcNfuxXOmPULkcXL+TDTH1yFOrjcm9YEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KwUqrMiU;
	arc=none smtp.remote-ip=91.218.175.31
Received: from mta0.migadu.com (out-31.mta0.migadu.com [91.218.175.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEFD606A886
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEFD606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KwUqrMiU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ctchA8+QA7OJ9mC0YgHbLm+kQmf4MKhJ/GLR+IFkTW0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794400547; v=1; x=1795005347;
 b=KwUqrMiUmqS5DrJumrSeLhRWD33GRtzvEWuXwXo4EchrlPRhs+/EHcV//OtLHwFX+2ejXrHL
 C62O9PVO4YQM0P89+Bcq7HKyYSWvD6W3k5il7se/NYnke9+bdvHbc3M5hwq5mcdnfohmWxanUKI
 OAJh1czWhOJjt4JftJkS38/s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 3bf1067f9e372de6;
	Wed, 11 Nov 2026 12:35:47 +0000
X-Mizu-Trace-ID: 3bf1067f9e372de6
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 20:35:27 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Breno Leitao <leitao@debian.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net] selftests: netconsole: enable the targets created by
 the torture test
Message-ID: <avRhDyP9sHREqgGP@fedora>
References: <20261110-netcons_selftest_fix-v1-1-86643b837216@debian.org>
 <avPLyMTFkhCRqRAS@fedora>
 <avRBD4SMHnfoqn3k@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avRBD4SMHnfoqn3k@gmail.com>

On Wed, Nov 11, 2026 at 02:20:08AM -0800, Breno Leitao wrote:
> Hello Hangbin,
> 
> On Wed, Nov 11, 2026 at 09:58:32AM +0800, Hangbin Liu wrote:
> > On Tue, Nov 10, 2026 at 04:32:25AM -0800, Breno Leitao wrote:
> > > create_and_delete_random_target() is meant to create, enable and remove
> > > targets while messages are sent, but it only creates and removes them.
> > > The helper it calls, _create_dynamic_target(), stopped enabling the
> > > target when the bonding test moved that step into
> > > create_dynamic_target().
> > > 
> > > Enable the targets again, so they come up while messages flow and are
> > > disabled before being removed. Like toggle_netcons_target(), ignore a
> > > failed enable, which would otherwise end the function and leave the
> > > targets behind. With a console per target, this also registers and
> > > unregisters their consoles under load.
> > > 
> > > Fixes: 236682db3b6f ("selftest: netcons: add test for netconsole over bonded interfaces")
> > > Signed-off-by: Breno Leitao <leitao@debian.org>
> > > ---
> > >  tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> > > index 33a44adb6f8f3a..3dfab0bf1b0756 100755
> > > --- a/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> > > +++ b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> > > @@ -46,6 +46,7 @@ create_and_delete_random_target() {
> > >  
> > >  		# Basic population so the target can come up
> > >  		_create_dynamic_target "${FORMAT}" "${RND_TARGET_PATH}"
> > > +		echo 1 > "${RND_TARGET_PATH}"/enabled 2> /dev/null || true
> > >  	done
> > >  
> > >  	echo "netconsole selftest: ${COUNT} additional targets were created" > /dev/kmsg
> > > 
> > > ---
> > > base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> > > change-id: 20261110-netcons_selftest_fix-4cbf633295ef
> > > 
> > > Best regards,
> > > --  
> > > Breno Leitao <leitao@debian.org>
> > > 
> > 
> > Ignore the failed enable makes sense to me, as we enabled `set -e`
> > and use random target.
> 
> ack!
> 
> > Do we need sleep 1s like create_dynamic_target() to make sure the
> > configuration loaded?
> 
> I don't think we need it. The write to enabled is synchronous:
> enabled_store() sets up netpoll and moves the target to STATE_ENABLED
> before it returns. If the setup fails, enabled reads back 0, and the
> disable loop checks enabled before writing 0 to it.
> 
> The other reason for that sleep, keeping the console messages in
> order, does not apply either, since the torture test does not read
> back any message.

Thanks for the explain.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
