Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381723E8C44
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323088; cv=none; b=umS7b7o+kP4qQoG4gVZ7Z9TPSsjwMQtBbR868oZVW3KJlT9hKpHHfojWY+W7QWw6Wb6r1zCo/9FABqhQOdsH+9kjW1IvuoGnRc1AzwzRI+yF2xdJzaoyayB5WqNvlQ7mTPUH6ikYBTj//k3j7OwRj3Cq1MfW+aWW5PibwNQJ9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323088; c=relaxed/simple;
	bh=8EucK66XEEt5oArrsNZY4ulWEBsTiTP5z3rc8bTSoAM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZTHamtr2dmSlJastIta/rEZZcFs+gWxCn2j+Kw9UpdTHGrOvfS/YwLOCxwkwdmJQG3SxbY5vccwtXZZZzIKUt5K/KcAYNwIeBJaOHui4yTo/d7zTkYVYftLnay3m7bO+UOn638F5xAPRPnVQIcR6DxmhisWDpygU1QwDOYXKilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=ZqtCkBMK; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="ZqtCkBMK"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 77F9FC348B;
	Sun, 13 Sep 2026 21:11:16 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 77F9FC348B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789323077;
	bh=d6Nbp9iqsy0h2YKV7nco20Yixosbq1I0HvQUxxVO9Iw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZqtCkBMK4lZCr8sOufCkT2mNGfxT/kqkWNtfLUUWyhnTettteuw7dWBr2Ij3KNG4U
	 MHyzqHuuLW2Y8a9GpFJzsXQe6Oyq24uoARZtkYkFMOs4UQUAJ35k4ihuVphIAaGzts
	 zQp/JUFttQhhlxgnsJz1yLSfcoAUH8P5+p6nXxqtfSIsqoGyEu9n7kRkcjzoHqNBF6
	 3GQOehypxGQ9Q0nVMG52Hz2Ownf7kGDgtNvVx/Y47fv4GwSqaElzgxsjbt5fJz6DO2
	 /WfeyumWWXGn4MRgzoKOh93TNAuDyzcFvO7ntrl+EGGqA4rz+fDrzwjpdJ9jzHN7dl
	 skrLIiBU0TeUA==
Message-ID: <20269ce23ee7deaffe5b45574ad2a21703288979.camel@rendec.net>
Subject: Re: [PATCH 01/14] genirq: fix typos in comments
From: Radu Rendec <radu@rendec.net>
To: Hemanth Selam <hemanth.selam@gmail.com>, Thomas Gleixner
 <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org
Date: Sun, 13 Sep 2026 14:11:14 -0400
In-Reply-To: <20260907065303.18034-1-hemanth.selam@gmail.com>
References: <20260907065303.18034-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-07 at 12:23 +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.=C2=A0 Only touches comments, no=
 code
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
> =C2=A0kernel/irq/msi.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> index fb5f372215bf..b22d74496af1 100644
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -142,7 +142,7 @@ static int msi_insert_desc(struct device *dev, struct=
 msi_desc *desc,
> =C2=A0 *				insert it at @init_desc->msi_index
> =C2=A0 *
> =C2=A0 * @dev:	Pointer to the device for which the descriptor is allocate=
d
> - * @domid:	The id of the interrupt domain to which the desriptor is adde=
d
> + * @domid:	The id of the interrupt domain to which the descriptor is add=
ed
> =C2=A0 * @init_desc:	Pointer to an MSI descriptor to initialize the new d=
escriptor
> =C2=A0 *
> =C2=A0 * Return: 0 on success or an appropriate failure code.
> @@ -416,7 +416,7 @@ EXPORT_SYMBOL_GPL(msi_domain_first_desc);
> =C2=A0 * @domid:	The id of the interrupt domain which should be walked.
> =C2=A0 * @filter:	Descriptor state filter
> =C2=A0 *
> - * The first invocation of msi_next_desc() has to be preceeded by a
> + * The first invocation of msi_next_desc() has to be preceded by a
> =C2=A0 * successful invocation of __msi_first_desc(). Consecutive invocat=
ions are
> =C2=A0 * only valid if the previous one was successful. All these operati=
ons have
> =C2=A0 * to be done within the same MSI mutex held region.

Thanks for the patch. For your next patch series, please send all the
patches in the series in a single git-send-email command and make sure
email threads are enabled. That way, all the patches in the series will
be grouped, both on lore.kernel.org and in people's mailboxes.

I tried to look up the thread on lore.kernel.org to see if the entire
series consisted solely of typo fixes. I couldn't. But then I
accidentally searched just for "typo" and noticed you had sent many of
these, across multiple subsystems. So I guess I have my answer.

Anyway, the patch itself looks good, so...

Reviewed-by: Radu Rendec <radu@rendec.net>
