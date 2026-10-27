Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124779;
	b=KL+P8Yx3+e5FKwhydkRpgE9iyq6bHUzO8X6hoBzyq8/oOfBBCQxUG/8YRsr65DgRxLGH
	 bmIhfMGa+UaMtbimoj1mkd3HQzaMq6XUMup4b0sh5jcwCU0FNrngLWmFLhthiBVZo/wiw
	 gKNx9MkPOPzya/Li/soCbbtt19yfaF7PJEQmMy5poTF1eHNUuO40GxmNXvxdeW7zRfkeB
	 j06WHk2FwJyKopYOwRn61h5BRKBi9qXdxBZtIDzMy3lHrK/zJDO3PG7HY3CSHn8FwvJJA
	 /atfTIMf87//laQCE0JbcwMfOtDenFlJQPdZ/p40f7nxM22OC9HDCKqUiVshCSOImpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124779;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=m+qpiMLYrvzrWB47eJ8fBVYC5yEFfdvO/rZaUVVK93I=;
	b=nG7gpyelJDzmNbXY9kKnDdl9Qk+ysob/7qL7GyjyQXsPFKRhWbDQtZiYqisDlXYUma8H
	 WZUtOgEdiwzF3SkfIOY40Ju1f1klfkz/rTtAQ4AUH4S0bg6mWJeR5wO1i0OopW9YLGG1v
	 VTa2Gdt1NnaiYQqI/iOzoE/lqNmXc02JRWx6Th9vmJaAO8lWammXGZASvupnlW7XM0KDa
	 QXsFYOgUxjCkQH4Qx/dgWLkOwH1+ZbKLMby4M2oCCE1mUXm9WTfdlHeMz/SF4fwGawvXA
	 QM590NbWdxjM1ENVV5HtNVFP8va1Hqj4smDXk4bPKl67p74WEVbG13wNdzwVlA4CIpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1892606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1892606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5587351d419so164045b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124778; x=1793729578;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+qpiMLYrvzrWB47eJ8fBVYC5yEFfdvO/rZaUVVK93I=;
        b=MKW9WJCfldchF+tGSzAHZDS0/NqypqGg6S/TYYUrjSz2rp2N5qZXbzTt+dopDLNL3Y
         vJxeHmWmKo0S2m2eSLks9Qy+JeuS7D1BchizX62+y7sBpcpPiLvIhP85ytE7KT34edxp
         mo2ktZkN08lOwvkDbSHYTZsphVE43qhOSKg6MXwZk6VnVgOTb8dfehILlFmGNupjYunD
         anGu6Mdkf3ahnXKzjccPwcaCuCZZygZ3i9KTbkBma2rknE8NNxKbGhYNQ9OCNtlah0dw
         e61qgasFhZ5JDH+ufproT4s72uFzv67HU08QqMUppm1TsZ7JyR1t8rY5xzu+Cnaa/9iH
         WNKQ==
X-Gm-Message-State: AFq9FYLd6S5dCuA4P2YFU78GmMyheCw3dCUMM+hXh/n317Neu19uL5Fr
	PogGvE5y1ghsq4dKJwXbcmVWFaWr05MAk2/KFHTPAIVoL644CmgTYfMMjX6F/5ig1K5Y07RdMIq
	l6j6M7bbTh8C9bm54tcd/xvudOeiFhr6HrrceQd+f5W8E8BYIj8evEpPBAKY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1202:b0:4f5:eaac:5151 with SMTP id
 5614622812f47-55c002a4419mr7327518b6e.39.1793124777878; Tue, 27 Oct 2026
 11:12:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:12:57 -0700
In-Reply-To: <6a682bf7.70955b6c.323240.0052.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0e9a9.47d0a7c9.33355c.007a.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [acpica?] KASAN: use-after-free Read in acpi_ns_get_attached_object
From: syzbot <syzbot+5725792ce6a9938d1b24@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [acpica?] KASAN: use-after-free Read in acpi_ns_get_attached_object
Author: jeff@incrediblybased.co

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/acpi/acpica/utdelete.c
b/drivers/acpi/acpica/utdelete.c index e818009..28a13f0 100644
--- a/drivers/acpi/acpica/utdelete.c
+++ b/drivers/acpi/acpica/utdelete.c
@@ -558,12 +558,18 @@ acpi_ut_update_object_reference(union
acpi_operand_object *object, u16 action)
/*
* For complex sub-objects, push them onto the stack
* for later processing (this eliminates recursion.)
+ * If no state can be allocated, update the sub-object
+ * right away. Abandoning the walk here would leave
+ * this object and the remaining sub-objects with
+ * unbalanced reference counts.
*/
status =
acpi_ut_create_update_state_and_push
(next_object, action, &state_list);
if (ACPI_FAILURE(status)) {
- goto error_exit;
+ (void)
+ acpi_ut_update_object_reference
+ (next_object, action);
}
break;
}
@@ -587,7 +593,10 @@ acpi_ut_update_object_reference(union
acpi_operand_object *object, u16 action)
action,
&state_list);
if (ACPI_FAILURE(status)) {
- goto error_exit;
+ (void)acpi_ut_update_object_reference(object->
+ bank_field.
+ region_obj,
+ action);
}
break;

@@ -601,7 +610,10 @@ acpi_ut_update_object_reference(union
acpi_operand_object *object, u16 action)
action,
&state_list);
if (ACPI_FAILURE(status)) {
- goto error_exit;
+ (void)acpi_ut_update_object_reference(object->
+ index_field.
+ data_obj,
+ action);
}
break;

@@ -645,20 +657,6 @@ acpi_ut_update_object_reference(union
acpi_operand_object *object, u16 action)
}

return (AE_OK);
-
-error_exit:
-
- ACPI_EXCEPTION((AE_INFO, status,
- "Could not update object reference count"));
-
- /* Free any stacked Update State objects */
-
- while (state_list) {
- state = acpi_ut_pop_generic_state(&state_list);
- acpi_ut_delete_generic_state(state);
- }
-
- return (status);
}

/*******************************************************************************
