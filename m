Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EFE3D6485
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171171; cv=none; b=lu9+QCIX0CLyYW4DBp7EL2i9MfOsivxqrknVc1VBlr0LzAdIbJkRT8fcxi8Eo0c0h3KrWVUty7sAExvH34i/Rr6KTX1vqnW0a6O7TWfh0bM8a8x6cj4R2y4yFPQ6QKPLL785o3GNg+nVUEH0zy6NbWuImuotlSTL7r3XH9mAUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171171; c=relaxed/simple;
	bh=dnyIY19dLxw05HsEeuWg7mzHgyn2dvLHC/d6PiX+Ktc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXkuY4jl/XZYtuAyiMRD5vbTt8J76+InC7u3BEaDDG1PRn6o0KHfk8KGJ6rE9CR5tQRJPPZgsvUlvCyNvVEU/+x8UXuxClLUBbajKZQ6JmjzAw7nt9rwj7tx9lTpsQFv7SHnwFd8IcnFG/qovcr/7MCNo+XeB0kpHzmKz5ZfnLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWdwfqiu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWdwfqiu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4151F000E9;
	Mon, 31 Aug 2026 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788171169;
	bh=xQJef04znVmx/W2PDkeCdQ/Gpw6qjCa3J2NOTa0THgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iWdwfqiuShjXftBi5VVmUtQleFTLVNOlf4AGpja1d+2LIH1p6aK42kHfhMPbKmuyr
	 +zUFkqO7BmZgtz6ICYtj27629t2+9CjLX9VKnmL/JyxrfhF+Yaz0ilwuJQvXjqnn8y
	 BlmG/4pnMgLjg6i7kwjzS/oWg/NjPdqPmPWJZyOZ6d0XPFIPcfIsunP3/Owu2yvrke
	 b4LQKAp9DvJSlZM1+JYByaTzMqdgnEW8L2ws7xAS2RK4VNfSvl4+L/gehEbf5CAA7B
	 iwjSRD/4msaAWEvnGLDM1rqPonvqx4/ZKzGuC+Qk1NvPduQi3deS4HFwQ00lls0udG
	 uaFCYQA6vfAAQ==
From: Christian Brauner <brauner@kernel.org>
To: Tao Cui <cui.tao@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>,
	jack@suse.cz,
	kees@kernel.org,
	cyphar@cyphar.com,
	containers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cuitao@kylinos.cn
Subject: Re: (subset) [PATCH 0/2] userns: clean up dead code on error paths
Date: Mon, 31 Aug 2026 12:12:30 +0200
Message-ID: <20260831-anfielen-bisschen-kehlkopf-852f282aa530@brauner>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828091659.358700-1-cui.tao@linux.dev>
References: <20260828091659.358700-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=brauner@kernel.org; h=from:subject:message-id; bh=dnyIY19dLxw05HsEeuWg7mzHgyn2dvLHC/d6PiX+Ktc=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRNDZ7bwWf91PZQU8Gj39Z/bjN6VIvu55vVlnDYmfFl7 8aW8++6OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYicYPhv88Hy8o9Hqxej4z3 zlmoVTOjZKdU0IuADYJq077fXMW89ycjw8973qEuP7099t7+H9JtzMNiuW3v6jmRclfWNPKtaUu fzA4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 17:16:57 +0800, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> Two small cleanups on the create_user_ns() and map_write() error
> paths.  Both remove code that provably cannot have an effect; no
> behavior change.
> 
>   user_namespace.c:164-167: the key_put() at fail_keyring has been
>   dead since it was copy-pasted from free_user_ns() in 2016
>   (dbec28460a89); persistent_keyring_register is only ever assigned
>   lazily from key_get_persistent(), long after create_user_ns().
> 
> [...]

Applied to the vfs-7.4.namespace branch of the vfs/vfs.git tree.
Patches in the vfs-7.4.namespace branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: master

[1/2] userns: remove dead key_put() on the create_user_ns() error path
      https://git.kernel.org/vfs/vfs/c/fec2c3c0744b
