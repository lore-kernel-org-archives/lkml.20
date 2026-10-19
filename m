Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC23328FD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374717; cv=none; b=C7pJFkrX7fHMvBlZ1YNmV0DueKqZlNgqdOPh8+/sN1PY1d1qTt6lsPAQpInt0hyuxmfsH3ZlVDprCpu1pcW2Ek3lX/Tt3thKIAV+5gzo+W7IDZpWjNII7aU5xP/CaTTZ2009GfwJ2GROrpQJsAk7oFek9KoxYy3L7Rd6OLzegsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374717; c=relaxed/simple;
	bh=dJf5aNrSNg4rFY9B1UazH2P1ovIP6akJS8UoeywHcSA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Tv8p9tmhIbcW0ytmY7R/fwGKUcmKEtY6vFn7VGtwRge+83aglL5RCbLKZWU8t4rr2XcWNMfpNI6049xY333ouS+piheggGa1rm4LMFzJgVx4JKnUNTXUbVoE+QdsoSwQd0FIJ269R4A2rvhcXbgSd7gniRDUR5CRTdivAkYwcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-846cc4c0e44so1313964a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792374714; x=1792979514;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BBwtaZPYXlVRZtki1rulkkNQUzshXpDM7VslLyJUzUM=;
        b=xrUIPfz7d7nCBytWDaFg2Sa8cBqKnOAZ88VMdaV0wLK7NIAAO7yzQZ9ZrqyHJ5wSP9
         sRFYYO5f/tP+p/Dz9YHNjuT0X3Qu6mjhGg7tGYbRCmdsaxi6QLBEYnyCoKe6wT2SrMbD
         wEQJtdDgaoZ8U77NoJEkVs8VoVeTpSeniyOadrgix1SXUjLgnSmrSrTmFRgDfC830C/I
         UJSvtm9txJTb0xrjByG/Ie9tRbxjG/ONuzmq15LQejrNNKVVckqncrkT+2D5wJ0HCfOT
         q1VVKvMpm8IwlLEtPzDXgCjCIULzeXwHrMydvR8qLKRcmQCg7XPmXOQ+Aap5q4q8rv2b
         oLqg==
X-Forwarded-Encrypted: i=1; AKwUvBytase0GKLlUTf1u/seTexfXf6HiidjCri3KECZe3OhS4oohHb2Ni2yYeIEToRNMDf5AmIkp2zDa45zLDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Hlcyn+N1oQRPXDTN63ZM/VhuYizRMYOAGS0SKyWJuAB5NwyV
	30v5V4J0U97Q0j1MShdaWTK+LEv7rM/xviH3MEpfolnN7OGcq9iU510mwmN4kualOY7c3KSK6Wb
	M/izSmw6OcraMwdKti5xjRR2XnKL1N9CZxV6b3iitHmFho1mAo9WXNNebLPw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23ce:b0:4fc:32cc:6c0e with SMTP id
 5614622812f47-536f241da2amr6227863b6e.6.1792374714522; Sun, 18 Oct 2026
 18:51:54 -0700 (PDT)
Date: Sun, 18 Oct 2026 18:51:54 -0700
In-Reply-To: <20261019015139.806-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad577ba.7f4e89eb.3d59aa.00bb.GAE@google.com>
Subject: Re: [syzbot] [rdma?] possible deadlock in rds_trans_get_preferred
From: syzbot <syzbot+ccdb5058c3df2d94811c@syzkaller.appspotmail.com>
To: hdanton@sina.com
Cc: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

>> Date: Sun, 18 Oct 2026 12:14:36 -0700	[thread overview]
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    70dd4ee72eb2 Merge tag 'pinctrl-v7.3-3' of git://git.kerne..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1271a69c580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=44ac479246d4559b
>> dashboard link: https://syzkaller.appspot.com/bug?extid=ccdb5058c3df2d94811c
>> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>> userspace arch: i386
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15b9618e580000
>
> #syz test

"" does not look like a valid git branch or commit.

>
> --- x/include/rdma/rdma_cm.h
> +++ y/include/rdma/rdma_cm.h
> @@ -167,6 +167,7 @@ struct rdma_cm_id *rdma_create_user_id(r
>    * asynchronous operations associated with the id.
>    */
>  void rdma_destroy_id(struct rdma_cm_id *id);
> +void rdma_destroy_id_wq(struct rdma_cm_id *id);
>  
>  /**
>   * rdma_restrict_node_type - Restrict an RDMA identifier to specific
> --- x/net/rds/ib.c
> +++ y/net/rds/ib.c
> @@ -486,7 +486,7 @@ static int rds_ib_laddr_check_cm(struct
>  		 cm_id->device ? cm_id->device->node_type : -1);
>  
>  out:
> -	rdma_destroy_id(cm_id);
> +	rdma_destroy_id_wq(cm_id);
>  
>  	return ret;
>  }
> --- x/drivers/infiniband/core/cma_priv.h
> +++ y/drivers/infiniband/core/cma_priv.h
> @@ -110,6 +110,7 @@ struct rdma_id_private {
>  	 */
>  	struct rdma_restrack_entry     res;
>  	struct rdma_ucm_ece ece;
> +	struct work_struct destroy_work;
>  };
>  
>  #if IS_ENABLED(CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS)
> --- x/drivers/infiniband/core/cma.c
> +++ y/drivers/infiniband/core/cma.c
> @@ -2126,6 +2126,25 @@ void rdma_destroy_id(struct rdma_cm_id *
>  }
>  EXPORT_SYMBOL(rdma_destroy_id);
>  
> +static void destroy_id_work(struct work_struct *work)
> +{
> +	struct rdma_id_private *id_priv =
> +		container_of(work, struct rdma_id_private, destroy_work);
> +
> +	mutex_lock(&id_priv->handler_mutex);
> +	destroy_id_handler_unlock(id_priv);
> +}
> +
> +void rdma_destroy_id_wq(struct rdma_cm_id *id)
> +{
> +	struct rdma_id_private *id_priv =
> +		container_of(id, struct rdma_id_private, id);
> +
> +	INIT_WORK(&id_priv->destroy_work, destroy_id_work);
> +	queue_work(cma_wq, &id_priv->destroy_work);
> +}
> +EXPORT_SYMBOL(rdma_destroy_id_wq);
> +
>  static int cma_rep_recv(struct rdma_id_private *id_priv)
>  {
>  	int ret;
> --
