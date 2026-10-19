Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591983B840E;
	Mon, 19 Oct 2026 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395106; cv=none; b=dnyqz5290eLfsvBzUyanwBCkv4p6WprRUQHVjxKfd/weHUJzJlS2rV/K6Leu9gkYGw+dWcOD3wN2GNvPI2Hfg3yxpYjDmLCQu1FyXWpHa8iX1QZmv8Tgb7xxCyKgHOmGBNoJyOPdEUrentb3v1bEpsY8iJgfrftEplpG3IXDqmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395106; c=relaxed/simple;
	bh=npQj46EvY7u5qgOiWzbH5jWF8fnpxCSAIXbe9L78/PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQjHfhAtPSKIU7mXUvcofgcsX/PEdnbcjjUoH73mEVqFU6fqJDLbMpGNLyaYPe9L5O+lN8uUuKjJ8MmaXM5RP8W7frlKNMycmzsSs55mvGa8zibud7nyZyf2ZpdRpPYnQFb7Rn0w1OX7XMHu6NqbBJcX+05UbHuxlOqQHUYBujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L96tv452; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L96tv452"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1027BE9C;
	Mon, 19 Oct 2026 09:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792394976;
	bh=npQj46EvY7u5qgOiWzbH5jWF8fnpxCSAIXbe9L78/PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L96tv452HdTHCLJlix+74JdyOKa0bgzkJuPnwkC6CeWrTwB4SRbOPpY0S2c8WTW7+
	 agAl5RSZTP42A3SKk0hs8AYxStLfpZoXcvq5xd+zWhkLVKiMza7QOTQdsjfKxKa7Rs
	 Fa//yD6jaGBTDTQANYKaeurE8DHk2vqSf9BSVfHE=
Date: Mon, 19 Oct 2026 09:31:39 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Jiale Yao <yaojiale02@163.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: c3-mipi-csi2: handle runtime resume failure
Message-ID: <atXFmYHrVP5uwIbj@zed>
References: <20261003081129.433041-1-yaojiale02@163.com>
 <20261003081129.433041-3-yaojiale02@163.com>
 <99b34523-8ee2-431f-ad1b-c1e11dd1412a@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99b34523-8ee2-431f-ad1b-c1e11dd1412a@amlogic.com>

Hi Keke

On Mon, Oct 19, 2026 at 02:24:34PM +0800, Keke Li wrote:
> Hi Jiale,
>
> On 10/3/26 16:11, Jiale Yao wrote:
> > [You don't often get email from yaojiale02@163.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > [ EXTERNAL EMAIL ]
> >
> > c3_mipi_csi_enable_streams() ignores runtime resume failures and starts
> > the receiver before reporting that streaming is enabled. If the power
> > domain could not be resumed, this accesses unavailable registers and
> > the disable path later drops a reference that was not acquired.
> >
> > Return the runtime PM error before starting the receiver.
> >
> > Fixes: b63ef604a28d ("media: platform: Add C3 MIPI CSI-2 driver")
> > Signed-off-by: Jiale Yao <yaojiale02@163.com>
> > ---
> >   drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> > index b9e4ef3fc308..4731d58bf2dd 100644
> > --- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> > +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> > @@ -431,7 +431,9 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
> >
> >          src_sd = media_entity_to_v4l2_subdev(csi->src_pad->entity);
> >
> > -       pm_runtime_resume_and_get(csi->dev);
> > +       ret = pm_runtime_resume_and_get(csi->dev);
> > +       if (ret < 0)
> Is   ' if (ret)'  better?

Does your driver depend on select PM ? It doesn't seem the case to me.

If PM is disabled pm_runtime_resume_and_get() returns 1
if my reading of

        static inline int __pm_runtime_resume(struct device *dev, int rpmflags)
        {
                return 1;
        }

is correct.

If you
        if (ret)

also this case will be caught as an error, while we instead want to
continue as the peripheral is meant to stay powered on from probe() if
CONFIG_PM is not selected.

(I quickly had a look at the csi2 driver probe() routine
c3_mipi_csi_probe() and it doesn't seem to power up the interface in
probe() to support !CONFIG_PM. Personally, I would just select PM
unconditionally almost everywhere these days and be done with it).

> > +               return ret;
> >
> >          c3_mipi_csi_start_stream(csi);
> >
> > --
> > 2.34.1
> >
