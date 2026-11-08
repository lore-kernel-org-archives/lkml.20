Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128677;
	b=XL+Cu4D3Pila2/3aQL4/5HFKIao4MVO3fZhvet/uDGYemv98CTd52ChtsDiCcLluQKGB
	 oeMcpCOTWe3P2ZOBKvV61tGewWKzniTQWGe3kuECytPbP27Ox6Of8OI3g8YYv1egv/7K0
	 r4ojxQmtEWoAfAlB8PrM18s4pM8KNDIbTUjU14Tp2fF+llcmjvVsuwaEu2nwQjJ+hcA2o
	 gTQ+n2U6ytaJobN91wBLvxuX5lg3AUrW+6JG7oMfAw+bAHJ791hGoCDyZtNZcWODZyVPt
	 kJRueMUdKHgG06mBzezlUAz1Xb3cRQsnO4iNSxGLwHzeriE5kbq2MqjZPLyOR6+iajg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128677;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Queue-Id:X-Rspamd-Server:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=g+uPuVo7hdDQxbdPOA+21fd2Xo9/nEzItzLhxNDIk0E=;
	b=VwahmxIzyn9A6PU1zQrFG5920NhdaapKU4+Xl8fqQUAeqBqrwqSxH0qP2vxW1i75EgGp
	 hXzt4D6W6iyQYRpZlhgKg9hgz3CUCCG8P0jCBbEKEqE0sU+nolmNZRZF3Cdgq+Mb28G0Z
	 EH94WfiZTURq8/ko4LIKKRjH2IBbrUc1wCGI4ARp+gQdUJevPFJqP0Owp1r8vwusW+Bhr
	 lfT0Dnf9ypbD/62ayZ0HOAA8mwB2Aeb4zNIzMxD/7ijb4mP1oiWlYUJQcrHpAt0Z6xZy2
	 /yG5fO69AaAcNUFiLfocVPkp42Dn4BY0Iz4Hq2clFLl09DTzJz36DqCh5tbH3g4PLyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D35606A335;
	Sun,  8 Nov 2026 09:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D35606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 9A22280465;
	Sun,  8 Nov 2026 09:04:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id A5B902F;
	Sun,  8 Nov 2026 09:04:33 +0000 (UTC)
Message-ID: <671a7f6bda4ec81f56e3eb7ee287bce4a96b9d5d.camel@perches.com>
Subject: Re: [PATCH 0/4] checkpatch: improve exit criterias
From: Joe Perches <joe@perches.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Andy Whitcroft
	 <apw@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Date: Sun, 08 Nov 2026 01:04:32 -0800
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
References: 
	<20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: A5B902F
X-Rspamd-Server: rspamout08
X-Stat-Signature: gmbmb9drrituzxrzi86i834pzj96o6r4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/zxib4s+/H/4MC6B6hGX7GC5VUPIHsRDg=
X-HE-Tag: 1794128673-423947
X-HE-Meta: U2FsdGVkX19k4dYIRe3m9MiVG2RJQEukPdiYBS8Tdcfp1YV/9KMlonnYfRUUgkEug9XY3vC3BO17h74vH2CTW2TyxK+nZvcCu84GT3gm7aIN15wYmSUqWG8I7Cx0O8U4ULBWAkOaAfGm7d3D4I95FSrpYHK2LhhyX5eC8KOq21h9Akp4iE6sbpaQryiXbWqXIcRu9Edlzze0v/BwKiwxmzeD5VeNXry4DZ3SPxGL/vZoX2EMNZBu77FIHxGHcPhXL2XNg7t7AsIgAATeKv2sIqbt19mOad6lR4pQ3AbpOTMBpaIjxgaAAZSzmWFtynYvqm/5Y47v3NvH7XhVQBQ1RrLfOPQCf4IZ8jwNY3bMvhM=

On Sun, 2026-11-08 at 04:21 +0000, Bjorn Andersson wrote:
> When invoking checkpatch with the --mailback argument over a range of
> patches the tool unexpectedly exits successfully on the first clean
> patch. For example:
>=20
>   ./scripts/checkpatch.pl --mailback --git v7.3-rc1..

Why is it useful to do this?
