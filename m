Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803483;
	b=QLjMcbXmNRcVGWCnKhVzbBYDPzRWJqVkWAmSCv9oClFUz1tDOZyPqEHMVVfzgUOOKb1/
	 hcb6TiiOdOGTP/214EyjOiwaMl1zdbUqlZZztv3bfBDM3h0h2ZxdQccFqOHY5h3EDTMoz
	 q0GeBz/NpfHnlb4zXjCh5nw8Y6CA9vRx5ksQC6W3r1aq/0RBNvhA/TfTVuUmgF/jX65LI
	 os6uYWELz6cQOSz4hwy18FmCrsl2BbBCFSCwvGXAjUkLJCFtSPgHQzjqgB1QDZ2BDnTKt
	 bAgQei9AjkBTL9jaZsUmr3sJkSBb+iJPMoAUBCQq3Mb9M6qf/644vItNNGfjbWboj3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803483;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmZMoog7Knh/OMnJRYd6yhL9S4j+bQeuh5tH/D8XkYs=;
	b=GNIzaV0jJrwB23eDJBexZlXYPQ3mb1yurVFaH7s5LbfrOTeKUxe9+bmsHAsqnVl5PirS
	 qhqtgZK4Igd8I0bGRZznvT4JeKASUOYSweNnMjlglgRFsknjs5f8CqRBwVW1tG46e21r/
	 eP5mapwZEF3mmAdE6FyMOmNvUtEFuQSs+q0l6E06wC8UCPeKBm97qXApnPHNDhnZFHks8
	 GtSBsQlxLmeDOE1inJgItljvfzvWfjYYmggDZVh1Va99TaTAg5UOE4cEGF6E+MWixwCmF
	 LRK4jevwMs2zD52TTRUpkvRMYL+ycfuk6YT5WDZef/WL9pNe2Ky8opO7CZEqY0PLh4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIpwWVJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B70606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIpwWVJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54551F00A1E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803481;
	bh=gmZMoog7Knh/OMnJRYd6yhL9S4j+bQeuh5tH/D8XkYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JIpwWVJDSZthuxauytHZVpUBhT35lDXWU7JnrJh15d+/c76AHM0G2XtbpGRK6yUwf
	 VQF2Ifo55xwfPF4A+jja/aQAfhdSlde//PwWH5cD4HLluPLXbGipFmpwf5K2MD1/rS
	 WCarMKbC+QGEzjT/HvfGYm5il6FIpFWzOIJAXbyT7DWvlPwP7sp4IDwVfaP7iJamHJ
	 JSB4ysBFQt3OOH/W9AAYLVcbE7i1edPrUT/j5+XyWCZbRr6ELD2oLY9czFMgHOt2yn
	 9jriZr7SV03MOvWpif0KUNFbD9vFvXzXBrB2K3XtT4X4qLY9H9Dbck14UfQ1ZczE+8
	 bBd2U/LyYauJQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso642748e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzx6EbaZSK0Q14r+gxPKjM7GXwgxznWiY4VQhoEjxFHQYBoUM05syZQLYxqcEGJTjE0wpVulEbX7bmUKAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ay3ZgeXdhtSzzmdZL4D93IBkPq7XsC4wiNaABtjgS0ZlrtUg2
	w2R6na59AQy2Vk2JadVXX6/DKQNgzVsQCU3Db1BB5n5O49mPQYoOKVuYpxL+RwhsIWOlLXNZnW0
	BNsQeiJD4J5SjRt4foVmEYYXw+qYBqx4=
X-Received: by 2002:a05:6512:3e03:b0:5ba:41f0:5a45 with SMTP id
 2adb3069b0e04-5bfd9561f19mr5431515e87.21.1793803480211; Wed, 04 Nov 2026
 06:44:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103221717.3840215-1-briannorris@chromium.org> <20261103141442.v2.1.If69ddc515c2e9fd4338441e87688b9d690d2ef36@changeid>
In-Reply-To: <20261103141442.v2.1.If69ddc515c2e9fd4338441e87688b9d690d2ef36@changeid>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 4 Nov 2026 15:44:27 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jb+=Wzp+awZmtk-PXB+oS+NQk+VXKCtXCFo8ELLUc9yQ@mail.gmail.com>
X-Gm-Features: AclHuK9gTEmcX27Bq07hep_nJ7cMaPt2IP1nezlEMxrLMz_VLm2hu4KjJWZY_Xo
Message-ID: <CAJZ5v0jb+=Wzp+awZmtk-PXB+oS+NQk+VXKCtXCFo8ELLUc9yQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] PM: runtime: Only queue an idle check for
 RPM-linked suppliers (part 2)
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:23=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Commit be5755f023e7 ("PM: runtime: Only queue an idle check for
> RPM-linked suppliers") was incomplete. There are two other cases where
> we perform idle checks on non-DL_FLAG_PM_RUNTIME suppliers -- in
> pm_runtime_set_suspended(), and in cases where we failed to resume
> suppliers.
>
> Fixes: 5244f5e2d801 ("PM: runtime: Defer suspending suppliers")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> Noticed while touching this function in subsequent work.
>
> (no changes since v1)
>
>  drivers/base/power/runtime.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 304a2b123420..9d3508d9b4a2 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -343,6 +343,9 @@ static void __rpm_put_suppliers(struct device *dev, b=
ool try_to_suspend)
>
>         list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
>                                 device_links_read_lock_held()) {
> +               if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
> +                       continue;
> +
>                 pm_runtime_release_supplier(link);
>                 if (try_to_suspend)
>                         pm_request_idle(link->supplier);
> --

Applied as 7.4-rc material, thanks!
