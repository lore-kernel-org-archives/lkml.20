Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5699D560AAA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577535; cv=none; b=I+oZyAj83QjrUBLLporDf6JJ+Qq2hUGw/3fRj6m5SfhzSTmQiXuhWJxBHThBfm/nRKcFIBJjkPiKSfW4skkvaWXsdy98ZSZoDWdJmVBndmgqmlipHvsN6VjoxGLPJy0a9nlJnp/i4rcz/oMgnWG5cnb3RgKWrzINv6+5nNTVyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577535; c=relaxed/simple;
	bh=bFgK3ukjmtJNuGbfpgqx1xv8jQHyyObbaZVEZ2zRtq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJY65Q++TMc2E+01xS2vI0+0g2q2cgTpJI9gd5/a3hzd3jatiPERtHlyFs3g9dqWJ+H6MT0E/vSyGCfdvTwT0aWG4zTBywWYcYBRIIce0CXSNuP+Kr5RwzZjV8+a7XrPLzwB9o6VxZxLPKMIrG3aKqv8tTzNgHmO+vnFiye0Y1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgKHQg4X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgKHQg4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8ADA1F00893
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577518;
	bh=NUj0wKrqK9oBgtu2eiEakvgyfAimvxz1YG58g1rjVXs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HgKHQg4XyoiOOq9VdXr0qbE6bjRbKV+vK7DjNai6xHkt0pxWHqwluksFyN2/n+A/B
	 jgns7/Z3gl+R/zHxv7apxZAHwoSgoE2HaT8EiCArttge2B4fLo6arM2AEhYRbf8MHP
	 kIXmEBRw5pXf8x3oO5BmbkU4SOFGnUjnQYpvguRHI0PfljXQPciZ8Ud9r6namrBc2K
	 e2dXLgVN51X4zaDr3zMSqGUafvKK6HJH0Y98esiiE2MpCZw8ULFUB8Mho2YNJN3m6e
	 L4bOSSgWlzUM8wh3E0jKfAgzwnr41rblWY3042CLw+YFR2iI7U12AzEvUaaBl413nl
	 E6iTba2S9hIkg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b89a0e69dfso1108618e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNqh+fv6g4Pk5f/FggX1H2QeddWIIZTUqSPv8eHsZfSnkF2Cv2PrbLuGTepEuKA6bzSGEKQsNikAINw8M=@vger.kernel.org
X-Gm-Message-State: AFuF++mOCiZIORvsD+hW64e1wlVAFxGHouWWhJTolRSTPRP4F2GLetbJ
	qEHqiDrbchcWrGZMAnyYkhrnIzb/UbzFsIwKwu2QfBXbNeKLbmNvoc5AWDw+fqlxjaJqGF9xbSk
	sNrRmXWaYCVwRh6oZP/jAYcc5bH93DUI=
X-Received: by 2002:a05:6512:1150:b0:5b6:183b:d204 with SMTP id
 2adb3069b0e04-5b8b664dc85mr801099e87.43.1789577517184; Wed, 16 Sep 2026
 09:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904115351.9356-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904115351.9356-1-hemanth.selam@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 16 Sep 2026 18:50:36 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h6+uXD-qLAOA42Q6kqLhQ-Xc_a8iwA=nkGS1sfTdFPLw@mail.gmail.com>
X-Gm-Features: AcwNN1X9_1qiQR8q_uoWcDj5LDai1SfsgUl76MJJL45-9NjAZsj2t15REp1Lq5w
Message-ID: <CAJZ5v0h6+uXD-qLAOA42Q6kqLhQ-Xc_a8iwA=nkGS1sfTdFPLw@mail.gmail.com>
Subject: Re: [PATCH] pm-graph: fix typo "hierachy" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Todd E Brandt <todd.e.brandt@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 1:53=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Correct "hierachy" to "hierarchy", reported by scripts/checkpatch.pl usin=
g
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  tools/power/pm-graph/sleepgraph.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/power/pm-graph/sleepgraph.py b/tools/power/pm-graph/sl=
eepgraph.py
> index f6d172254829..c8bc3bed3f5a 100755
> --- a/tools/power/pm-graph/sleepgraph.py
> +++ b/tools/power/pm-graph/sleepgraph.py
> @@ -1448,7 +1448,7 @@ class DevProps:
>
>  # Class: DeviceNode
>  # Description:
> -#       A container used to create a device hierachy, with a single root=
 node
> +#       A container used to create a device hierarchy, with a single roo=
t node
>  #       and a tree of child nodes. Used by Data.deviceTopology()
>  class DeviceNode:
>         def __init__(self, nodename, nodedepth):
> --

Applied as 7.4 material, thanks!
