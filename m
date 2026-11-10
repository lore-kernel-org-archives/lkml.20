Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322456;
	b=jw7NMUu8krTrmssWk2JsnRS6qz0fVUtvT2/wXrtDXHnuDuVcalT98veygsYudN3K4CWn
	 +HFi1FJGUaEGyzmCQAFSanJjJrmficGxxk8uHqdRA+oKE4FOnVCQ3VL8dkHFwbfjGfk5F
	 QZBVS2w/UbvC7Yv1soWOR6QlrsXBvVTE3XGkgw6rv7djetGEz5s1TwkmX7fpkhM5eKqbd
	 PxKVJ8nEAG9AljdtWmyNxfua8m6OPzeLdqlxzaNcwX6C0JNIfPKRW0q0dNHv/TJIeA3QU
	 37NSZZZ0tNgjmopxnNr+mTG/ZlwxS4T2udZcqeegCdjlZlDpusKH0GFEY/W4s/KtyXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322456;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=SnsgpXpf9bo/xRiNgtQgvFK55IJt7inv1vR73O1BfS0=;
	b=ahBYx0uC0O96y4v9j6OQJPQcJ7eWlprpAc4s0VUv09jinW1hfOcdKAnFDuWh58Rcm592
	 oxP2I7ZQ8RwuScUA6j+MY8HWhcMYXrw8NfYVkm5+Om/gC5pc++OgPZ8xagyQ8+v1YMnpl
	 xxN+SqSui5mZNy4ipq2QoVeml65gy2tSk+o/z6t5pNjjJPfHe0a0wlekdLwH/Cw1ZVPbS
	 MfvWaVpi7zzB/GiezAK+Cb0qGE5hX3SWMBuw0WG7DBHNssCcHBirE31Fuikn0jFQdgBwv
	 ndrz7U7vOMC7PQ66lUopMj43sqcP+5C3nKDiAHGxGDyH4kg1ntZ/qiUMWvNTSLCaKkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413C606AA33;
	Tue, 10 Nov 2026 14:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E413C606AA33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 506DAA0930;
	Tue, 10 Nov 2026 14:54:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 5F6C96000B;
	Tue, 10 Nov 2026 14:54:07 +0000 (UTC)
Message-ID: <42048f8fba5c2726a488b28e94625938bc045f5a.camel@perches.com>
Subject: Re: [PATCH 0/4] checkpatch: improve exit criterias
From: Joe Perches <joe@perches.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Tue, 10 Nov 2026 06:54:06 -0800
In-Reply-To: <CADLxj5T36OOBR4J1HGNT3U7H1FwwvSPmBWYRM_vGAEsXfWT0MA@mail.gmail.com>
References: 
	<20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
	 <671a7f6bda4ec81f56e3eb7ee287bce4a96b9d5d.camel@perches.com>
	 <CADLxj5T36OOBR4J1HGNT3U7H1FwwvSPmBWYRM_vGAEsXfWT0MA@mail.gmail.com>
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
X-Stat-Signature: ftwyfocdcik3mrik36hsdp4qnesfb7cj
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 5F6C96000B
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18wUG1UX3JvveOYgV8IDLCV0QgG02xPMKA=
X-HE-Tag: 1794322447-284156
X-HE-Meta: U2FsdGVkX1/6P65vIOCScvicy/0kQCG4Zv0GrTwFALzggU3lRKWqHfEhUi3rKEouAus+91uQMZVaf0WFmg+9GjPhNZGrWiMMxFMniv72rsXnfnCV6jhNFSslPeqUbtSLOUxfXc68gdymTThGzs/e64Pp08zUMaaHih7TQpQdQUqF8hv48OMu1eK1Tdbv6nmvkfzGF6UoKpsV0HPRyFgP6DqFkeoimIONeUJzd0SxWgfCO0Zd5KO57/atrLoWcrbxpLt7ZAZXAAb/kZ1gunSAZ/l6kNabHV/sDN53bPZyjzcEMhEgXsmkFMeX7PZ9SA5nA+ueec33qBORZr0xXYoOpa2doNtY1rLsEqkGaXYp437KFCJfvZAw7nUwsUaUhEB4

On Tue, 2026-11-10 at 07:42 -0600, Bjorn Andersson wrote:
> On Sun, Nov 8, 2026 at 3:04=E2=80=AFAM Joe Perches <joe@perches.com> wrot=
e:
> >=20
> > On Sun, 2026-11-08 at 04:21 +0000, Bjorn Andersson wrote:
> > > When invoking checkpatch with the --mailback argument over a range of
> > > patches the tool unexpectedly exits successfully on the first clean
> > > patch. For example:
> > >=20
> > >   ./scripts/checkpatch.pl --mailback --git v7.3-rc1..
> >=20
> > Why is it useful to do this?
>=20
> My use case is that I create a maintainer branch off e.g. v7.3-rc1
> (now v7.4-rc1), then apply a bunch of patches and before pushing that
> out I run "checkpatch.pl --strict v7.3-rc1..".

I think the description for mailback should be changed to
be used only for a single commit as this proposal would
otherwise change the exit condition for the single use case no?

> But this is quite noisy, and the compressed "b4 prep --check" output
> is more what I'm looking for.

My b4 version is 0.14.3 and the man b4 for prep doesn't include
a --check option or description so I don't know what that output
looks like.

>  So, I borrowed the "checkpatch.pl -q
> --terse --no-summary --mailback --showfile" from there and it took me
> a while to realize the difference between:
>=20
> --mailback                 only produce a report in case of warnings/erro=
rs
>=20
> and "don't produce a report if the first commit is good".

So perhaps just don't use --mailback?

And remove the --showfile so checkpatch adds the git commit id
to the output and maybe add a front end little script to do
the git commit id to commit subject to make it easier to detect
what commit might need updating?
