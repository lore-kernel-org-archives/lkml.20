Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B4271443
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789848074; cv=none; b=mufTT8DhxIw19dEaJC+Ut5muxCcQ9MjFAXcFg6yaMhWViQws8Z3HcPKRKlTZHsF6ouP+ksuKsdu+GWBI0ggj+JrcLOeXK721T9Vtg/+B+y+gHt2+tM+VdfJmM9e5eqFcsZNdGf4YI3F6FEtp9JMsOpC1DQrycee4tjEPHDAUOA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789848074; c=relaxed/simple;
	bh=ap0vNgfwMB9zJUwzgoDJV1gHqvXChfmuUDaS852ALjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E97Sx3+HH1bRzVPdgA1OXlIALz66Pmaj6axNiu1p+Arls7Gpq3difGzJg1+gEKncDat4nzR/VKRPxfep+XBdmiw/68x0qkKIMtTmkq+4ZuMGVvoTGiy5j1FeDZaz2cYZC1OzsGidaAMiM8QSMfxLlPDhM3xGDc4+bZVEcMusdxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qmehditf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmmDH9wm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qmehditf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmmDH9wm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789848071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2WiqpZ38IeTcSvZnu1e4s7LhyZENQqAesrxM8ZNJ1ts=;
	b=QmehditfepPwpaqNURZpl/OnrrRlqExglckMxLDR5GAPQ9IO/npgRT25HaAamflURJLFUk
	IEAcyhDpeOSftoQtzkExajTadHBpqi5d+T5CqYTSFNOuVIg0fWRzY+qJXlNPAEZoc4Gb49
	SigEo117GGEjXLFeKaSxiQ8FmdI5THQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-RcPBuY8nO9SlOAkArh0O8w-1; Sat, 19 Sep 2026 16:01:09 -0400
X-MC-Unique: RcPBuY8nO9SlOAkArh0O8w-1
X-Mimecast-MFC-AGG-ID: RcPBuY8nO9SlOAkArh0O8w_1789848068
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4870142f030so983000f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789848068; x=1790452868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2WiqpZ38IeTcSvZnu1e4s7LhyZENQqAesrxM8ZNJ1ts=;
        b=ZmmDH9wmOEey+a2G1vHGXeZlgmdUS8ejvoDY/uCy1r9HERodo5JdgcPrPmawUwRB5g
         NAPiEV02Ap2TMSytKZv0vy9laQUxr0Ee1d7yGMwlYV2tF5ZHMhy7uc7P4EIiI67GTu0Z
         Na+lIZLfBq8XTNSHh4hD2YdyvomfDL1k4IR7iT8sqmJYsI3yMQ2FnAauBL1jDhKjqmP6
         Wp+fy1J1LgaPlUOZ2WR8eDaRh3jTQsbbIQ4WuTubBGNiLXqLf6sh8jOZ/jCpoMvvLXMm
         y5PAZyXhhkuDZl2w8VR9LCLyCkJvZ1xiqaEplBEZmcgUx6HDt8EYiXlrdfMQr09vN1H7
         AdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789848068; x=1790452868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WiqpZ38IeTcSvZnu1e4s7LhyZENQqAesrxM8ZNJ1ts=;
        b=h9AkO3/Aj2nlKPKj2PUG3gHP1psKL5dNND869AqYQDMjLT6f0Dq27lVkX85G+6+eof
         T19Yhk5WBn7cF2ELreLfYFBlzzCcGpWkFdkN11yUX5yZCmONW4r+3a3Pcl7pPwpl+GU1
         Ch5BHpnZ/uDM5r90MBf3p6Tpw6uMfj1bOzMr2Opv4/Ems9Zpfns8np0L6G8mtsa/rgUF
         XC45oIy+SuS3yLrLwiylz7XunpNnDv4NzYm7ny2jrwlqMOnRYlcLMyBJ06OXU7mYp4A3
         eaoj3NQTPdwM9UoqAWkrb5lnZ/txIZqKaI+DKDrkBbNAQrrg9Un979HDtnaeZ/M1TMN6
         vdOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF2/OBgBWaSKxWz7cP7PDgvhZArlaWnZ6TD+lP2NlVI7DZzOtSsmtn59H8q3A+BB0RiNEYF0fAD+O0GDo=@vger.kernel.org
X-Gm-Message-State: AFuF++m+k81DDYDjA9n+IDis0sXEEvZYkQmnLLyf4y7BsvUgBN0cM0zZ
	eumfXiyP3XGEQ43X/BnzVXej+E70MC6ejC7j0wlZSM6s3poVmTaN8r4b5UFP5c986sw+edFANLA
	nhdsm3D/963Xo3/b5wj3034o3M7olkIrZN4JDtQD8e74XCM8bwpBdH3LXpI1efEmgrA==
X-Gm-Gg: AYBFou2+9G38XA8FRpWMAiZtZxt7wDx6sLkKbi3lwZuLB2kQ/i2brvM8Mc558R15/io
	DF24lDx7HrM3w0kZUZNr6UrkwO/hvPYWsGINRGdxWXAcazGrNZHBTISwebzCI+I+YFtG8ZB90fo
	bYJ2YCXZVvyi5xeRWH6KFZN4aEpJD0zNMlcooNU/111O4Ct3xvTMsj5mJsfAnT5acsFS9ko/3TH
	Yp6I7Tkw0e4QAhc8kNPGh6WadDj4CmP2beByvmXj0X26Vz3XgScue3uFXguT02GJ+UVChCI/ZS1
	7c8XrzW4FnOPIhWUEWduPdoQ6x4V07IbVAJGNWO4hrXs1Brpu9ByLYSQRw016JgYDmWuQBlv2qE
	EK0Jd/mCEW+AfliiBtreJqJc=
X-Received: by 2002:a05:6000:3111:b0:487:8ef:2fcf with SMTP id ffacd0b85a97d-4871e26b86fmr8293459f8f.38.1789848067898;
        Sat, 19 Sep 2026 13:01:07 -0700 (PDT)
X-Received: by 2002:a05:6000:3111:b0:487:8ef:2fcf with SMTP id ffacd0b85a97d-4871e26b86fmr8293421f8f.38.1789848067244;
        Sat, 19 Sep 2026 13:01:07 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456325esm9392596f8f.15.2026.09.19.13.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:01:06 -0700 (PDT)
Date: Sat, 19 Sep 2026 16:01:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com,
	aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com, dbassey@redhat.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v9 3/4] media: virtio: Add scatterlist builder
Message-ID: <20260919160032-mutt-send-email-mst@kernel.org>
References: <20260917171921.2810550-1-briandaniels@google.com>
 <20260917171921.2810550-4-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917171921.2810550-4-briandaniels@google.com>

On Thu, Sep 17, 2026 at 01:19:19PM -0400, Brian Daniels wrote:
> From: Alexandre Courbot <gnurou@gmail.com>
> 
> This patch adds the scatterlist builder, which is used to construct
> scatterlists for virtio commands from V4L2 structures.
> 
> It adds drivers/media/virtio/scatterlist_builder.c and
> drivers/media/virtio/scatterlist_builder.h.
> 
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> Assisted-by: Antigravity:gemini-3.5-flash
> Co-developed-by: Brian Daniels <briandaniels@google.com>
> Signed-off-by: Brian Daniels <briandaniels@google.com>
> ---
>  drivers/media/virtio/Makefile              |   2 +-
>  drivers/media/virtio/scatterlist_builder.c | 515 +++++++++++++++++++++
>  drivers/media/virtio/scatterlist_builder.h | 109 +++++
>  3 files changed, 625 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/virtio/scatterlist_builder.c
>  create mode 100644 drivers/media/virtio/scatterlist_builder.h
> 
> diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makefile
> index 09d9834da..8290d8506 100644
> --- a/drivers/media/virtio/Makefile
> +++ b/drivers/media/virtio/Makefile
> @@ -2,6 +2,6 @@
>  #
>  # Makefile for the virtio-media device driver.
>  
> -virtio-media-objs := virtio_media_driver.o
> +virtio-media-objs := scatterlist_builder.o virtio_media_driver.o
>  
>  obj-$(CONFIG_MEDIA_VIRTIO) += virtio-media.o
> diff --git a/drivers/media/virtio/scatterlist_builder.c b/drivers/media/virtio/scatterlist_builder.c
> new file mode 100644
> index 000000000..97925b277
> --- /dev/null
> +++ b/drivers/media/virtio/scatterlist_builder.c
> @@ -0,0 +1,515 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> +
> +/*
> + * Scatterlist builder helpers for virtio-media.
> + *
> + * Copyright (c) 2024-2026 Google LLC.
> + */
> +
> +#include <linux/moduleparam.h>
> +#include <linux/scatterlist.h>
> +#include <linux/videodev2.h>
> +#include <media/videobuf2-memops.h>
> +
> +#include "uapi/linux/virtio_media.h"
> +#include "scatterlist_builder.h"
> +#include "session.h"
> +
> +/*
> + * If set to %true, then the driver will always copy the data passed to the
> + * host into the shadow buffer (instead of trying to map the source memory into
> + * the SG table directly when possible).
> + */
> +static bool always_use_shadow_buffer;
> +module_param(always_use_shadow_buffer, bool, 0660);
> +
> +/* Convert a V4L2 IOCTL into the IOCTL code we can give to the host */
> +#define VIRTIO_MEDIA_IOCTL_CODE(IOCTL) (((IOCTL) >> _IOC_NRSHIFT) & _IOC_NRMASK)
> +
> +/**
> + * scatterlist_builder_add_descriptor() - Add a descriptor to the chain.
> + * @builder: builder to use.
> + * @desc_index: index of the descriptor to add.
> + *
> + * Returns %-ENOSPC if @builder->sgs is already full.
> + */
> +int scatterlist_builder_add_descriptor(struct scatterlist_builder *builder,
> +				       size_t desc_index)
> +{
> +	if (builder->cur_sg >= builder->num_sgs)
> +		return -ENOSPC;
> +	builder->sgs[builder->cur_sg++] = &builder->descs[desc_index];
> +
> +	return 0;
> +}
> +
> +/**
> + * scatterlist_builder_add_data() - Append arbitrary data to the descriptor
> + *                                  chain.
> + * @builder: builder to use.
> + * @data: pointer to the data to add to the descriptor chain.
> + * @len: length of the data to add.
> + *
> + * @data will either be directly referenced, or copied into the shadow buffer
> + * to be referenced from there.
> + */
> +int scatterlist_builder_add_data(struct scatterlist_builder *builder,
> +				 void *data, size_t len)
> +{
> +	const size_t cur_desc = builder->cur_desc;
> +
> +	if (len == 0)
> +		return 0;
> +
> +	if (builder->cur_desc >= builder->num_descs)
> +		return -ENOSPC;
> +
> +	if (!always_use_shadow_buffer && virt_addr_valid(data + len)) {
> +		/*
> +		 * If "data" is in the 1:1 physical memory mapping then we can
> +		 * use a single SG entry and avoid copying.
> +		 */
> +		struct page *page = virt_to_page(data);
> +		size_t offset = (((size_t)data) & ~PAGE_MASK);
> +		struct scatterlist *next_desc =
> +			&builder->descs[builder->cur_desc];
> +
> +		memset(next_desc, 0, sizeof(*next_desc));
> +		sg_set_page(next_desc, page, len, offset);
> +		builder->cur_desc++;
> +	} else if (!always_use_shadow_buffer && is_vmalloc_addr(data)) {
> +		int prev_pfn = -2;
> +
> +		/*
> +		 * If "data" has been vmalloc'ed, we need at most one entry per
> +		 * memory page but can avoid copying.
> +		 */
> +		while (len > 0) {
> +			struct page *page = vmalloc_to_page(data);
> +			int cur_pfn = page_to_pfn(page);
> +			/* All pages but the first will start at offset 0. */
> +			unsigned long offset =
> +				(((unsigned long)data) & ~PAGE_MASK);
> +			size_t len_in_page = min(PAGE_SIZE - offset, len);
> +			struct scatterlist *next_desc =
> +				&builder->descs[builder->cur_desc];
> +
> +			if (builder->cur_desc >= builder->num_descs)
> +				return -ENOSPC;
> +
> +			/* Optimize contiguous pages */
> +			if (cur_pfn == prev_pfn + 1) {
> +				(next_desc - 1)->length += len_in_page;
> +			} else {
> +				memset(next_desc, 0, sizeof(*next_desc));
> +				sg_set_page(next_desc, page, len_in_page,
> +					    offset);
> +				builder->cur_desc++;
> +			}
> +			data += len_in_page;
> +			len -= len_in_page;
> +			prev_pfn = cur_pfn;
> +		}
> +	} else {
> +		/*
> +		 * As a last resort, copy into the shadow buffer and reference
> +		 * it with a single SG entry. Calling
> +		 * scatterlist_builder_retrieve_data() will be necessary to copy
> +		 * the data written by the device back into @data.
> +		 */
> +		void *shadow_buffer =
> +			builder->shadow_buffer + builder->shadow_buffer_pos;
> +		struct page *page = virt_to_page(shadow_buffer);
> +		unsigned long offset =
> +			(((unsigned long)shadow_buffer) & ~PAGE_MASK);
> +		struct scatterlist *next_desc =
> +			&builder->descs[builder->cur_desc];
> +
> +		if (len >
> +		    builder->shadow_buffer_size - builder->shadow_buffer_pos)
> +			return -ENOSPC;
> +
> +		memcpy(shadow_buffer, data, len);
> +		memset(next_desc, 0, sizeof(*next_desc));
> +		sg_set_page(next_desc, page, len, offset);
> +		builder->cur_desc++;
> +		builder->shadow_buffer_pos += len;
> +	}
> +
> +	sg_mark_end(&builder->descs[builder->cur_desc - 1]);
> +	return scatterlist_builder_add_descriptor(builder, cur_desc);
> +}
> +
> +/**
> + * scatterlist_builder_retrieve_data() - Retrieve a response written by the
> + *                                       device on the shadow buffer.
> + * @builder: builder to use.
> + * @sg_index: index of the descriptor to read from.
> + * @data: destination for the shadowed data.
> + *
> + * If the shadow buffer is pointed to by the descriptor at index @sg_index of
> + * the chain, then ``sg->length`` bytes are copied back from it into @data.
> + * Otherwise nothing is done since the device has written into @data directly.
> + *
> + * @data must have originally been added by scatterlist_builder_add_data() as
> + * the same size as passed to scatterlist_builder_add_data() will be copied
> + * back.
> + */
> +int scatterlist_builder_retrieve_data(struct scatterlist_builder *builder,
> +				      size_t sg_index, void *data)
> +{
> +	void *shadow_buf = builder->shadow_buffer;
> +	struct scatterlist *sg;
> +	void *kaddr;
> +
> +	/* We can only retrieve from the range of sgs currently set. */
> +	if (sg_index >= builder->cur_sg)
> +		return -ERANGE;
> +
> +	sg = builder->sgs[sg_index];
> +	kaddr = pfn_to_kaddr(page_to_pfn(sg_page(sg))) + sg->offset;
> +
> +	if (kaddr >= shadow_buf &&
> +	    kaddr < shadow_buf + VIRTIO_SHADOW_BUF_SIZE) {
> +		if (kaddr + sg->length >= shadow_buf + VIRTIO_SHADOW_BUF_SIZE)
> +			return -EINVAL;
> +
> +		memcpy(data, kaddr, sg->length);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * scatterlist_builder_add_ioctl_cmd() - Add an ioctl command to the descriptor
> + *                                       chain.
> + * @builder: builder to use.
> + * @session: session on behalf of which the ioctl command is added.
> + * @ioctl_code: code of the ioctl to add (i.e. ``VIDIOC_*``).
> + */
> +int scatterlist_builder_add_ioctl_cmd(struct scatterlist_builder *builder,
> +				      struct virtio_media_session *session,
> +				      u32 ioctl_code)
> +{
> +	struct virtio_media_cmd_ioctl *cmd_ioctl = &session->cmd.ioctl;
> +
> +	cmd_ioctl->hdr.cmd = VIRTIO_MEDIA_CMD_IOCTL;
> +	cmd_ioctl->session_id = session->id;
> +	cmd_ioctl->code = VIRTIO_MEDIA_IOCTL_CODE(ioctl_code);
> +
> +	return scatterlist_builder_add_data(builder, cmd_ioctl,
> +					    sizeof(*cmd_ioctl));
> +}
> +
> +/**
> + * scatterlist_builder_add_ioctl_resp() - Add storage to receive an ioctl
> + *                                        response to the descriptor chain.
> + * @builder: builder to use.
> + * @session: session on behalf of which the ioctl response is added.
> + */
> +int scatterlist_builder_add_ioctl_resp(struct scatterlist_builder *builder,
> +				       struct virtio_media_session *session)
> +{
> +	struct virtio_media_resp_ioctl *resp_ioctl = &session->resp.ioctl;
> +
> +	return scatterlist_builder_add_data(builder, resp_ioctl,
> +					    sizeof(*resp_ioctl));
> +}
> +
> +/**
> + * __scatterlist_builder_add_userptr() - Add user pages to @builder.
> + * @builder: builder to use.
> + * @userptr: pointer to userspace memory that we want to add.
> + * @length: length of the data to add.
> + * @sg_list: output parameter. Upon success, points to the area of the shadow
> + *           buffer containing the array of SG entries to be added to the
> + *           descriptor chain.
> + * @nents: output parameter. Upon success, contains the number of entries
> + *         pointed to by @sg_list.
> + *
> + * Data referenced by userspace pointers can be potentially large and very
> + * scattered, which could overwhelm the descriptor chain if added as-is. For
> + * these, we instead build an array of &struct virtio_media_sg_entry in the
> + * shadow buffer and reference it using a single descriptor.
> + *
> + * This function is a helper to perform that. Callers should then add the
> + * descriptor to the chain properly.
> + *
> + * Returns %-EFAULT if @userptr is not a valid user address, which is a case the
> + * driver should consider as "normal" operation. All other failures signal a
> + * problem with the driver.
> + */
> +static int
> +__scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
> +				  unsigned long userptr, unsigned long length,
> +				  struct virtio_media_sg_entry **sg_list,
> +				  int *nents)
> +{
> +	struct sg_table sg_table = {};
> +	struct frame_vector *framevec;
> +	struct scatterlist *sg_iter;
> +	struct page **pages;
> +	const unsigned int offset = userptr & ~PAGE_MASK;
> +	unsigned int pages_count;
> +	size_t entries_size;
> +	int i;
> +	int ret;
> +
> +	framevec = vb2_create_framevec(userptr, length, true);
> +	if (IS_ERR(framevec)) {
> +		if (PTR_ERR(framevec) != -EFAULT) {
> +			pr_warn("error %ld creating frame vector for userptr 0x%lx, length 0x%lx\n",
> +				PTR_ERR(framevec), userptr, length);
> +		} else {
> +			/* -EINVAL is expected in case of invalid userptr. */
> +			framevec = ERR_PTR(-EINVAL);
> +		}
> +		return PTR_ERR(framevec);
> +	}
> +
> +	pages = frame_vector_pages(framevec);
> +	if (IS_ERR(pages)) {
> +		pr_warn("error getting vector pages\n");
> +		ret = PTR_ERR(pages);
> +		goto done;
> +	}
> +	pages_count = frame_vector_count(framevec);
> +	ret = sg_alloc_table_from_pages(&sg_table, pages, pages_count, offset,
> +					length, 0);
> +	if (ret) {
> +		pr_warn("error creating sg table\n");
> +		goto done;
> +	}
> +
> +	/* Allocate our actual SG in the shadow buffer. */
> +	*nents = sg_nents(sg_table.sgl);
> +	entries_size = sizeof(**sg_list) * *nents;
> +	if (builder->shadow_buffer_pos + entries_size >
> +	    builder->shadow_buffer_size) {
> +		ret = -ENOMEM;
> +		goto free_sg;
> +	}
> +
> +	*sg_list = builder->shadow_buffer + builder->shadow_buffer_pos;
> +	builder->shadow_buffer_pos += entries_size;
> +
> +	for_each_sgtable_sg(&sg_table, sg_iter, i) {
> +		struct virtio_media_sg_entry *sg_entry = &(*sg_list)[i];
> +
> +		sg_entry->start = sg_phys(sg_iter);
> +		sg_entry->len = sg_iter->length;


same issue: reserved not zeroed out.

> +	}
> +
> +free_sg:
> +	sg_free_table(&sg_table);
> +
> +done:
> +	vb2_destroy_framevec(framevec);
> +	return ret;
> +}
> +
> +/**
> + * scatterlist_builder_add_userptr() - Add a user-memory buffer using an array
> + *                                     of &struct virtio_media_sg_entry.
> + * @builder: builder to use.
> + * @userptr: pointer to userspace memory that we want to add.
> + * @length: length of the data to add.
> + *
> + * Upon success, an array of &struct virtio_media_sg_entry referencing
> + * @userptr has been built into the shadow buffer, and that array added to the
> + * descriptor chain.
> + */
> +static int scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
> +					   unsigned long userptr,
> +					   unsigned long length)
> +{
> +	int ret;
> +	int nents;
> +	struct virtio_media_sg_entry *sg_list;
> +
> +	ret = __scatterlist_builder_add_userptr(builder, userptr, length,
> +						&sg_list, &nents);
> +	if (ret)
> +		return ret;
> +
> +	ret = scatterlist_builder_add_data(builder, sg_list,
> +					   sizeof(*sg_list) * nents);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * scatterlist_builder_add_buffer() - Add a &struct v4l2_buffer and its planes
> + *                                    to the descriptor chain.
> + * @builder: builder to use.
> + * @b: &struct v4l2_buffer to add.
> + */
> +int scatterlist_builder_add_buffer(struct scatterlist_builder *builder,
> +				   struct v4l2_buffer *b)
> +{
> +	int ret;
> +
> +	/* v4l2_buffer */
> +	ret = scatterlist_builder_add_data(builder, b, sizeof(*b));
> +	if (ret)
> +		return ret;
> +
> +	if (V4L2_TYPE_IS_MULTIPLANAR(b->type) && b->length > 0) {
> +		/* Array of v4l2_planes */
> +		ret = scatterlist_builder_add_data(builder, b->m.planes,
> +						   sizeof(struct v4l2_plane) *
> +							   b->length);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * scatterlist_builder_retrieve_buffer() - Retrieve a &struct v4l2_buffer
> + *                                         written by the device on the shadow
> + *                                         buffer, if needed.
> + * @builder: builder to use.
> + * @sg_index: index of the first SG entry of the buffer in the builder's
> + *            descriptor chain.
> + * @b: &struct v4l2_buffer to copy shadow buffer data into.
> + * @orig_planes: the original ``planes`` pointer, to be restored if the buffer
> + *               is multi-planar.
> + *
> + * If the &struct v4l2_buffer pointed to by @sg_index was copied into the
> + * shadow buffer, then its updated content is copied back into @b.
> + * Otherwise nothing is done as the device has written into @b directly.
> + *
> + * @orig_planes is used to restore the original ``planes`` pointer in case it
> + * gets modified by the host. The specification stipulates that the host should
> + * not modify it, but we enforce this for additional safety.
> + */
> +int scatterlist_builder_retrieve_buffer(struct scatterlist_builder *builder,
> +					size_t sg_index, struct v4l2_buffer *b,
> +					struct v4l2_plane *orig_planes)
> +{
> +	int ret;
> +
> +	ret = scatterlist_builder_retrieve_data(builder, sg_index++, b);
> +	if (ret)
> +		return ret;
> +
> +	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
> +		b->m.planes = orig_planes;
> +
> +		if (orig_planes) {
> +			ret = scatterlist_builder_retrieve_data(builder,
> +								sg_index++,
> +								b->m.planes);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * scatterlist_builder_add_ext_ctrls() - Add a &struct v4l2_ext_controls and its
> + *                                       controls to @builder.
> + * @builder: builder to use.
> + * @ctrls: &struct v4l2_ext_controls to add.
> + *
> + * Add @ctrls and its array of &struct v4l2_ext_control to the descriptor
> + * chain.
> + */
> +int scatterlist_builder_add_ext_ctrls(struct scatterlist_builder *builder,
> +				      struct v4l2_ext_controls *ctrls)
> +{
> +	int ret;
> +
> +	/* v4l2_ext_controls */
> +	ret = scatterlist_builder_add_data(builder, ctrls, sizeof(*ctrls));
> +	if (ret)
> +		return ret;
> +
> +	if (ctrls->count > 0) {
> +		/* array of v4l2_controls */
> +		ret = scatterlist_builder_add_data(builder, ctrls->controls,
> +						   sizeof(ctrls->controls[0]) *
> +							   ctrls->count);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * scatterlist_builder_add_ext_ctrls_userptrs() - Add the userspace payloads of
> + *                                                a &struct v4l2_ext_controls
> + *                                                to the descriptor chain.
> + * @builder: builder to use.
> + * @ctrls: &struct v4l2_ext_controls from which we want to add the
> + *         userspace payload.
> + *
> + * Add the userspace payloads of @ctrls to the descriptor chain. This is split
> + * out of scatterlist_builder_add_ext_ctrls() because we only want to add
> + * these to the device-readable part of the descriptor chain.
> + */
> +int
> +scatterlist_builder_add_ext_ctrls_userptrs(struct scatterlist_builder *builder,
> +					   struct v4l2_ext_controls *ctrls)
> +{
> +	int i;
> +	int ret;
> +
> +	/* Pointers to user memory in individual controls */
> +	for (i = 0; i < ctrls->count; i++) {
> +		struct v4l2_ext_control *ctrl = &ctrls->controls[i];
> +
> +		if (ctrl->size > 0) {
> +			unsigned long uptr = (unsigned long)ctrl->ptr;
> +
> +			ret = scatterlist_builder_add_userptr(builder, uptr,
> +							      ctrl->size);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * scatterlist_builder_retrieve_ext_ctrls() - Retrieve controls written by the
> + *                                            device on the shadow buffer,
> + *                                            if needed.
> + * @builder: builder to use.
> + * @sg_index: index of the first SG entry of the controls in the builder's
> + *            descriptor chain.
> + * @ctrls: &struct v4l2_ext_controls to copy shadow buffer data into.
> + *
> + * If the shadow buffer is pointed to by @sg_index, copy its content back into
> + * @ctrls.
> + */
> +int scatterlist_builder_retrieve_ext_ctrls(struct scatterlist_builder *builder,
> +					   size_t sg_index,
> +					   struct v4l2_ext_controls *ctrls)
> +{
> +	struct v4l2_ext_control *controls_backup = ctrls->controls;
> +	int ret;
> +
> +	ret = scatterlist_builder_retrieve_data(builder, sg_index++, ctrls);
> +	if (ret)
> +		return ret;
> +
> +	ctrls->controls = controls_backup;
> +
> +	if (ctrls->count > 0 && ctrls->controls) {
> +		ret = scatterlist_builder_retrieve_data(builder, sg_index++,
> +							ctrls->controls);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/media/virtio/scatterlist_builder.h b/drivers/media/virtio/scatterlist_builder.h
> new file mode 100644
> index 000000000..47bfd7ae0
> --- /dev/null
> +++ b/drivers/media/virtio/scatterlist_builder.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> +
> +/*
> + * Scatterlist builder helpers for virtio-media.
> + *
> + * Copyright (c) 2024-2026 Google LLC.
> + */
> +
> +#ifndef __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
> +#define __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
> +
> +#include <linux/scatterlist.h>
> +
> +#include "session.h"
> +
> +/**
> + * struct scatterlist_builder - helper to build a scatterlist from data.
> + * @descs: pool of descriptors to use.
> + * @num_descs: number of entries in descs.
> + * @cur_desc: next descriptor to be used in @descs.
> + * @shadow_buffer: pointer to a shadow buffer where elements that cannot be
> + * mapped directly into the scatterlist get copied.
> + * @shadow_buffer_size: size of @shadow_buffer.
> + * @shadow_buffer_pos: current position in @shadow_buffer.
> + * @sgs: descriptor chain to eventually pass to virtio functions.
> + * @num_sgs: total number of entries in @sgs.
> + * @cur_sg: next entry in @sgs to be used.
> + *
> + * Virtio passes data from the driver to the device (through e.g.
> + * virtqueue_add_sgs()) via a scatterlist that the device interprets as a
> + * linear view over scattered driver memory.
> + *
> + * In virtio-media, the payload of ioctls from user-space can for the most part
> + * be passed as-is, or after slight modification, which makes it tempting to
> + * just forward the ioctl payload received from user-space as-is instead of
> + * doing another copy into a dedicated buffer. This structure helps with this.
> + *
> + * virtio-media descriptor chains are typically made of the following parts:
> + *
> + * Device-readable:
> + * - A command structure, i.e. ``virtio_media_cmd_*``,
> + * - An ioctl payload (one of the regular ioctl parameters),
> + * - (optionally) arrays of &struct virtio_media_sg_entry describing the
> + *   content of buffers in guest memory.
> + *
> + * Device-writable:
> + * - A response structure, i.e. ``virtio_media_resp_*``,
> + * - An ioctl payload, that the device will write to.
> + *
> + * This structure helps laying out the descriptor chain into its @sgs member in
> + * an optimal way, by building a scatterlist adapted to the originating memory
> + * of the data we want to pass to the device while avoiding copies when
> + * possible.
> + *
> + * It is made of a pool of &struct scatterlist (@descs) that is used to
> + * build the final descriptor chain @sgs, and a @shadow_buffer where data that
> + * cannot (or should not) be mapped directly by the host can be temporarily
> + * copied.
> + */
> +struct scatterlist_builder {
> +	struct scatterlist *descs;
> +	size_t num_descs;
> +	size_t cur_desc;
> +
> +	void *shadow_buffer;
> +	size_t shadow_buffer_size;
> +	size_t shadow_buffer_pos;
> +
> +	struct scatterlist **sgs;
> +	size_t num_sgs;
> +	size_t cur_sg;
> +};
> +
> +int scatterlist_builder_add_descriptor(struct scatterlist_builder *builder,
> +				       size_t desc_index);
> +
> +int scatterlist_builder_add_data(struct scatterlist_builder *builder,
> +				 void *data, size_t len);
> +
> +int scatterlist_builder_retrieve_data(struct scatterlist_builder *builder,
> +				      size_t sg_index, void *data);
> +
> +int scatterlist_builder_add_ioctl_cmd(struct scatterlist_builder *builder,
> +				      struct virtio_media_session *session,
> +				      u32 ioctl_code);
> +
> +int scatterlist_builder_add_ioctl_resp(struct scatterlist_builder *builder,
> +				       struct virtio_media_session *session);
> +
> +int scatterlist_builder_add_buffer(struct scatterlist_builder *builder,
> +				   struct v4l2_buffer *buffer);
> +
> +int scatterlist_builder_retrieve_buffer(struct scatterlist_builder *builder,
> +					size_t sg_index,
> +					struct v4l2_buffer *buffer,
> +					struct v4l2_plane *orig_planes);
> +
> +int scatterlist_builder_add_ext_ctrls(struct scatterlist_builder *builder,
> +				      struct v4l2_ext_controls *ctrls);
> +
> +int
> +scatterlist_builder_add_ext_ctrls_userptrs(struct scatterlist_builder *builder,
> +					   struct v4l2_ext_controls *ctrls);
> +
> +int scatterlist_builder_retrieve_ext_ctrls(struct scatterlist_builder *builder,
> +					   size_t sg_index,
> +					   struct v4l2_ext_controls *ctrls);
> +
> +#endif // __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
> -- 
> 2.55.0.1082.g2b9226bbc0-goog

