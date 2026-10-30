Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387317;
	b=X5RJ/s3cFqJFJK04IbuUTcIXtSO+Yw4/gDZq65wb6WN/UWcNGrkKBuShe1NPuWoafAzn
	 8zXBmprCPDe+uuBpvsjRk8gH0vDWWM2UWD+by6LjxGdOhMNhxxL+qwEgekSIVaMz1MNke
	 fO2+XsNDVNF3irlBR2YjztXy9lIeueCA5x4rBPMvH95lCFIAUaV3ZNMGj2Xm8lx8kFq9J
	 vyvzgcGysYSDqsZfo2VJ9RuhwIgDdNsLLBZ14iMzImJ4eaM4/Op/jl+Jcc8pE/lof4wv+
	 AhEqs0Gj/SHocxSWuxyGwinY51GPrMLZMDkhuJMlVHQMGirOF8AmfUv/KaGDw0j1iHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387317;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Scanned-By;
	bh=Va2Eg5mi4slMDww3PpgRIT9CM1a6Wp8eGW0k+gF1Y5o=;
	b=pQ2ftFxwSA9ZmMk6pPkdD2+Tqq0tA0nEudw2IMMpOnLawp92RM51bfSThTerQiASpPZ+
	 lrW8P8uCBwVqhsr6y4iZeoN8wUCxtzbIutin4T9RocaY/YJYrdvVsWCoXLalaul814DWg
	 lsAqq1XOGBUM4X5oqS3FO8vuW18TP3j4jt3rKzTpdfVSU+RpCCL0zeuN/v0jDYFv8vXSx
	 5j/s257cuL+tCuCZw+MZ8zkeV+s40yUayP9Y1Q+7lbdNmE/wjPW9cRooZw8HbHjoJ9KjK
	 vMO7dc8XRWBnz/M85TpoL1GdKo3hjDyeDs8/oM8fbX3m5ocIupxkgnffErvawNDarHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cN4oZMk0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C79606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cN4oZMk0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793387315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Va2Eg5mi4slMDww3PpgRIT9CM1a6Wp8eGW0k+gF1Y5o=;
	b=cN4oZMk0rhGaddQ/UHkiFx+a1xsFuVCiLnByajkqzXNNNN568hcLGllb21kNs2FT6HKl5c
	bzUdS5LtGB3ZOsRDHFWAIJ38KadAApfjj6LxGbEYvzLS2DyCADt8zuJ+R4HRdXVEMM5iTs
	LkNUSZgwQ4XHpfSKmZJXcx/hBuxhWRM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-388-8Rgm5s0iOVaexA1cFNxbIQ-1; Fri,
 30 Oct 2026 15:08:32 -0400
X-MC-Unique: 8Rgm5s0iOVaexA1cFNxbIQ-1
X-Mimecast-MFC-AGG-ID: 8Rgm5s0iOVaexA1cFNxbIQ_1793387311
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1F981955EAD;
	Fri, 30 Oct 2026 19:08:30 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B79330002C9;
	Fri, 30 Oct 2026 19:08:30 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.17.1) with ESMTPS id 69UJ8So61113819
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 15:08:29 -0400
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.18.1/Submit) id 69UJ8S121113814;
	Fri, 30 Oct 2026 15:08:28 -0400
Date: Fri, 30 Oct 2026 15:08:28 -0400
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Ming Hung Tsai <mtsai@redhat.com>
Cc: Rahul Rao <shreeramrahul94@gmail.com>, Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Joe Thornber <thornber@redhat.com>, dm-devel@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Subject: Re: [PATCH] dm thin: prevent use-after-free when metadata and data
 devices alias
Message-ID: <auTrLIW1sH8dOf3H@redhat.com>
References: <20261026110402.103622-1-shreeramrahul94@gmail.com>
 <auGBLzpQBLvds2vl@redhat.com>
 <CALjSBEs6qTsyFPCrDnL0GZ=WUojdEeOq9wVhEXJrgDr0N0kDyQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALjSBEs6qTsyFPCrDnL0GZ=WUojdEeOq9wVhEXJrgDr0N0kDyQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Sat, Oct 31, 2026 at 02:47:44AM +0800, Ming Hung Tsai wrote:
> On Wed, Oct 28, 2026 at 1:10 PM Benjamin Marzinski <bmarzins@redhat.com> wrote:
> >
> > On Mon, Oct 26, 2026 at 04:34:02PM +0530, Rahul Rao wrote:
> > > pool_ctr() takes separate specification strings for the metadata and data
> > > devices. However, different strings (or format representations such as
> > > /dev/ram0 and 1:0) can resolve to the same underlying block device.
> > >
> > > When the read_only feature is requested, the metadata device is opened
> > > read-only before the data device is opened read-write. If the devices
> > > alias, the second dm_get_device() call upgrades the existing device's
> > > mode. upgrade_mode() replaces the dm_dev and drops the old table device,
> > > leaving pool_ctr() with a stale metadata_dev pointer. The subsequent
> > > metadata_dev->bdev access triggers a KASAN use-after-free report.
> > >
> > > Acquire the read-write data device first so that acquiring the metadata
> > > device cannot trigger this mode upgrade. Then reject matching block
> > > devices, including those specified through different names, and release
> > > the devices in reverse acquisition order on error.
> >
> > What this patch fixes looks good to me, but there is still an issue
> > here. There is a similar problem in thin_ctr() if the pool and origin
> > device name strings are different but they alias. Unfortunately, this
> > style of fix doesn't work as well there. It is only a valid fix for a
> > thin-pool target because that is a DM_TARGET_SINGLETON. That means there
> > can't be another target that's part of the same table. This isn't the
> > case with the thin target. There can be other targets in the table, and
> > you can't force correct dm_get_device() ordering between them. Like
> > Mikulas said about a similar issue with dm-snapshot, this is probably
> > something that is better fixed in dm_get_device() than in its callers.
> >
> > -Ben
> 
> Agreed. Fixing in dm_get_device() looks like the right direction. A
> possible approach is to avoid upgrade_mode() and allow a
> dm_dev_internal to hold multiple references to table_devices of
> different modes. This way we can fix dm-thin by simply comparing the
> block_device pointers in pool_ctr() and thin_ctr() after
> dm_get_device() returns, and reject the table if they alias.
> 
> dm-snapshot already has the block_device comparison, so once
> dm_get_device() is fixed it is covered too.
> 
> I have a rough WIP that seems to confirm the idea, though the approach
> still needs refinement.

The big issue I see is the dm_table_get_devices() callers. They
currently assume that they are getting a list of devices with no
duplicates. I'm pretty sure that we'll need to add a flag to
dm_dev_internal so that we can mark duplicates, and we probably need to
always mark the read-only device as the duplicate. Then all the callers
of dm_table_get_devices() need to skip the duplicate devices.

-Ben
 
> >
> > >
> > > Reported-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=83827f9a59abe148bff4
> > > Fixes: 991d9fa02da0 ("dm: add thin provisioning target")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
> > > ---
> > >  drivers/md/dm-thin.c | 22 ++++++++++++++--------
> > >  1 file changed, 14 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> > > index 59392de7a477..52e47874048d 100644
> > > --- a/drivers/md/dm-thin.c
> > > +++ b/drivers/md/dm-thin.c
> > > @@ -3326,18 +3326,24 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
> > >
> > >       metadata_mode = BLK_OPEN_READ |
> > >               ((pf.mode == PM_READ_ONLY) ? 0 : BLK_OPEN_WRITE);
> > > -     r = dm_get_device(ti, argv[0], metadata_mode, &metadata_dev);
> > > +     r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
> > >       if (r) {
> > > -             ti->error = "Error opening metadata block device";
> > > +             ti->error = "Error getting data device";
> > >               goto out_unlock;
> > >       }
> > > -     warn_if_metadata_device_too_big(metadata_dev->bdev);
> > >
> > > -     r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
> > > +     r = dm_get_device(ti, argv[0], metadata_mode, &metadata_dev);
> > >       if (r) {
> > > -             ti->error = "Error getting data device";
> > > -             goto out_metadata;
> > > +             ti->error = "Error opening metadata block device";
> > > +             goto out_data;
> > > +     }
> > > +
> > > +     if (metadata_dev->bdev == data_dev->bdev) {
> > > +             ti->error = "Metadata and data devices must be different";
> > > +             r = -EINVAL;
> > > +             goto out;
> > >       }
> > > +     warn_if_metadata_device_too_big(metadata_dev->bdev);
> > >
> > >       if (kstrtoul(argv[2], 10, &block_size) || !block_size ||
> > >           block_size < DATA_DEV_BLOCK_SIZE_MIN_SECTORS ||
> > > @@ -3426,9 +3432,9 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
> > >  out_free_pt:
> > >       kfree(pt);
> > >  out:
> > > -     dm_put_device(ti, data_dev);
> > > -out_metadata:
> > >       dm_put_device(ti, metadata_dev);
> > > +out_data:
> > > +     dm_put_device(ti, data_dev);
> > >  out_unlock:
> > >       mutex_unlock(&dm_thin_pool_table.mutex);
> > >
> > > --
> > > 2.43.0
> >
> >

